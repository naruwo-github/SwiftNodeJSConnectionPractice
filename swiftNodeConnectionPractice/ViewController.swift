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
    let url = "http://localhost:7070"
    let url2 = "http://0.0.0.0:7070"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //繰り返し処理をメインスレッドにて行う
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            //urlからjsonを取得する
            Alamofire.request(self.url2)
                .responseJSON { response in
                    guard let object = response.result.value else {
                        return
                    }
                    let json = JSON(object)
                    let platform = json["platform"].string!
                    let nodeVersion = json["nodeVersion"].string!
                    let uptime = json["uptime"].string!
                    print(json)
            }
        }
    }
}

