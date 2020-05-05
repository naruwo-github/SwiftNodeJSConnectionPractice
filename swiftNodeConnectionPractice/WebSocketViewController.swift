//
//  WebSocketViewController.swift
//  swiftNodeConnectionPractice
//
//  Created by Narumi Nogawa on 2020/05/05.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit
import SocketIO

class WebSocketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let manager = SocketManager(socketURL: URL(string:"http://0.0.0.0:8080/")!, config: [.log(true), .compress])
    var socket : SocketIOClient!
    var dataList :NSMutableArray! = []
    
    @IBOutlet weak var logTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        socket = manager.defaultSocket

        socket.on(clientEvent: .connect){ data, ack in
            print("socket connected!")
        }

        socket.on(clientEvent: .disconnect){data, ack in
            print("socket disconnected!")
        }

        socket.on("from_server"){data, ack in
            if let message = data as? [String]{
                print(message[0])
                self.dataList.insert(message[0],at: 0)
                self.logTableView.reloadData()
            }
        }
        socket.connect()
    }
    
    @IBAction func tapButtonPressed(_ sender: Any) {
        socket.emit("from_client", "button pushed!!")
    }
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        socket.connect()
    }
    
    @IBAction func disconnectButtonPressed(_ sender: Any) {
        socket.disconnect()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = dataList[indexPath.row] as? String;
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
