//
//  LoginViewController.swift
//  swiftNodeConnectionPractice
//
//  Created by Narumi Nogawa on 2020/05/05.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let isLoggedIn = UserDefaults.standard.bool(forKey: "loginState")
        if isLoggedIn {
            //ログイン済み
            self.present(AjaxViewController(), animated: true, completion: nil)
        } else {
            //未登録
        }
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
