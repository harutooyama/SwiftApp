//
//  UserRegisterViewController.swift
//  Messenger
//
//  Created by Owner on 2020/06/11.
//  Copyright © 2020 Owner. All rights reserved.
//

import UIKit
import NCMB

class UserRegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userIdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func userRegisterButtonTapped(_ sender: Any) {
        let user = NCMBUser()
        user.userName = self.userIdTextField.text
        user.password = self.passwordTextField.text
        
        let acl = NCMBACL()
        acl.setPublicReadAccess(true)
        user.acl = acl
        
        user.signUpInBackground({(error) in
            if (error != nil){
                print("ユーザ登録失敗:\(error)")
            }else{
                print("ユーザ登録完了")
                let alert = UIAlertController(title: "登録完了", message: "ユーザ登録完了しました。",preferredStyle:  .alert)
                alert.addAction(UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: {(action:UIAlertAction) -> Void in
                        _ = self.navigationController?.popToRootViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        })
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
