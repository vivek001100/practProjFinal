//
//  ViewController.swift
//  PracProj
//
//  Created by VM on 14/03/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailEdit: UITextField!
    
    @IBOutlet weak var passwordEmailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordEmailText.isSecureTextEntry = true
    }

    @IBAction func registerAction(_ sender: Any) {
        let registerStoryBoard = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(registerStoryBoard, animated: true)
    }
    
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        let userDefault = LocalUserDefault()
        let email = emailEdit.text!
        let password = passwordEmailText.text!
        let isUserVerified = userDefault.verifyUserDetail(user: User(name: nil, email: email, password: password))
        let tabViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabViewController") as! TabViewController
        if(isUserVerified){
            print(" verified!!")
            tabViewController.user = userDefault.getUser()
            
            self.view.window?.rootViewController = tabViewController
            self.view.window?.makeKeyAndVisible()
        }
        else{
            print("not verified!!")
            showToast(message: "Invalid Email or Password")
        }
    }
}



