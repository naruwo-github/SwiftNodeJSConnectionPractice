//
//  ViewController.swift
//  swiftNodeConnectionPractice
//
//  Created by Narumi Nogawa on 2020/05/04.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var nodeVersionLabel: UILabel!
    @IBOutlet weak var uptimeLabel: UILabel!
    
    let url = "http://localhost:7070"
    let url2 = "http://0.0.0.0:7070"
    
    let timer = DispatchSource.makeTimerSource(flags: [], queue: .main)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.timer.schedule(deadline: .now(), repeating: 0.5)
        self.timer.setEventHandler {
            //urlからjsonを取得する
            Alamofire.request(self.url2)
                .responseJSON { response in
                    guard let object = response.result.value else {
                        return
                    }
                    let json = JSON(object)
                    self.setupLabels(json: json)
            }
        }
        //開始
        timer.resume()
    }
    
    @IBAction func connectButtonTapped(_ sender: Any) {
        if self.connectButton.titleLabel?.text == "Connecting" {
            self.connectButton.setTitle("Connect", for: UIControl.State.normal)
            //一時停止
            timer.suspend()
        } else {
            self.connectButton.setTitle("Connecting", for: UIControl.State.normal)
            timer.resume()
        }
        //破棄
        //timer.cancel()
    }
    
    func setupLabels(json: JSON) {
        if let platform = json["platform"].string {
            self.platformLabel.text = "Platform : " + platform
        } else {
            self.platformLabel.text = "Platform : " + "no response..."
        }
        if let nodeVersion = json["nodeVersion"].string {
            self.nodeVersionLabel.text = "NodeVersion : " + nodeVersion
        } else {
            self.nodeVersionLabel.text = "Platform : " + "no response..."
        }
        if let uptime = json["uptime"].int {
            self.uptimeLabel.text = "Uptime : " + String(uptime)
        } else {
            self.uptimeLabel.text = "Platform : " + "no response..."
        }
    }
    
}

//グローバルな関数として定義
//遅延実行の関数
func delay(_ delay: Double, closure: @escaping ()->()) {
  DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
    closure()
  }
}

