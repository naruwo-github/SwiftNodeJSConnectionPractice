//
//  LoginViewController.swift
//  swiftNodeConnectionPractice
//
//  Created by Narumi Nogawa on 2020/05/05.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainAboveLabel: UILabel!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var registerLoginButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    var isLoggedIn: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "loginState")
        
        self.passwordAgainAboveLabel.isHidden = self.isLoggedIn ? true : false
        self.passwordAgainTextField.isHidden = self.isLoggedIn ? true : false
        
        if self.isLoggedIn {
            //ログイン済み
            self.registerLoginButton.setTitle("Login", for: UIControl.State.normal)
        } else {
            //未登録
        }
    }
    
    @IBAction func registerLoginButtonTapped(_ sender: Any) {
        if isLoggedIn {
            //ログインの処理
            let id = userDefaults.string(forKey: "id")
            let password = userDefaults.string(forKey: "password")
            //ユーザの確認
            if id != self.idTextField.text || password != self.passwordTextField.text {
                self.displayMyAlertMessage(userMessage: "Wrong id or password.")
            } else {
                //アラートの表示と画面遷移
                let completeAlert = UIAlertController(title:"Alert", message: "Welcome!!", preferredStyle:  UIAlertController.Style.alert)
                let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default){
                    action in self.performSegue(withIdentifier: "goToAjaxVC", sender: self)
                }
                completeAlert.addAction(okAction)
                self.present(completeAlert, animated: true, completion: {
                    self.loadView()
                    self.viewDidLoad()
                })
            }
        } else {
            //登録の処理
            let id = self.idTextField.text
            let password = self.passwordTextField.text
            let again = self.passwordAgainTextField.text
            //フィールドは入力必須
            if id == "" || password == "" || again == "" {
                self.displayMyAlertMessage(userMessage: "These are required form.")
                return
            }
            //パスワードは二回入力させる
            if password != again {
                self.displayMyAlertMessage(userMessage: "Passwords don't match.")
                return
            }
            //ユーザ情報登録
            userDefaults.set(id, forKey: "id")
            userDefaults.set(password, forKey: "password")
            userDefaults.set(true, forKey: "loginState")
            //アラートの表示と画面遷移
            let completeAlert = UIAlertController(title:"Alert", message: "Welcome!!", preferredStyle:  UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default){
                action in self.performSegue(withIdentifier: "goToAjaxVC", sender: self)
            }
            completeAlert.addAction(okAction)
            self.present(completeAlert, animated: true, completion: {
                self.loadView()
                self.viewDidLoad()
            })
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        userDefaults.removeObject(forKey: "loginState")
        userDefaults.removeObject(forKey: "id")
        userDefaults.removeObject(forKey: "password")
        self.isLoggedIn = false
        //vcのリロード
        self.loadView()
        self.viewDidLoad()
    }
    
    //アラートを表示する関数
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:  UIAlertController.Style.alert)
        let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        myAlert.addAction(okAction);
        self.present(myAlert,animated:true, completion:nil)
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
