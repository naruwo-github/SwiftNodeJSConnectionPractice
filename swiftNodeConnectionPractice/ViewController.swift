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
                    //let platform = json["platform"].string
                    //let nodeVersion = json["nodeVersion"].string
                    //let uptime = json["uptime"].string
                    print(json)
            }
        }
    }
    
    @IBAction func connectButtonTapped(_ sender: Any) {
        // 開始
        timer.resume()
        // 一時停止
        //timer.suspend()
        //タイマー破棄
        //timer.cancel()
    }
    
}

//グローバルな関数として定義
//遅延実行の関数
func delay(_ delay: Double, closure: @escaping ()->()) {
  DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
    closure()
  }
}

