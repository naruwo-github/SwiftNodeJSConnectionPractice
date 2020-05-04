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
        
        Alamofire.request(url2)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                //let name = json["Name"].string!
                print(json)
        }
    }
}

