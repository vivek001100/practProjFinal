//
//  RegisterViewController.swift
//  PracProj
//
//  Created by VM on 17/03/23.
//

import UIKit

class RegisterViewController: UIViewController {
    let userDefault=LocalUserDefault()

    @IBOutlet weak var newConfirmPasswordEdit: UITextField!
    @IBOutlet weak var newPasswordEdit: UITextField!
    @IBOutlet weak var newNameEdit: UITextField!
    @IBOutlet weak var newEmailEdit: UITextField!
    @IBOutlet weak var cancelBtn: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        newPasswordEdit.isSecureTextEntry = true
        newConfirmPasswordEdit.isSecureTextEntry = true
        navigationItem.setHidesBackButton(true, animated: false)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(back))
           cancelBtn.isUserInteractionEnabled = true
           cancelBtn.addGestureRecognizer(tapGestureRecognizer)
        }

        @objc func back() {
            self.navigationController?.popViewController(animated: true)
        }

        // Do any additional setup after loading the view.
    
    

    @IBAction func onRegister(_ sender: Any) {
        if(saveNewUser()){
            let tabViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabViewController") as! TabViewController
          
                tabViewController.user = userDefault.getUser()
            
          
            self.view.window?.rootViewController = tabViewController
            self.view.window?.makeKeyAndVisible()
        }
//
    }
    
    func saveNewUser() -> Bool{
        let email = newEmailEdit.text ?? ""
        let pass = newPasswordEdit.text ?? ""
        let cnfPass = newConfirmPasswordEdit.text ?? ""
        let name = newNameEdit.text ?? ""
        
        if (!email.isEmpty && !pass.isEmpty && !cnfPass.isEmpty){
            if(pass == cnfPass){
                let newUser = User(name: name, email: email, password: pass)
                userDefault.setUserDetails(newUser: newUser)
                return true
            }
            else{
                showToast(message: "Password not match")
            }
        }
        else{
            showToast(message: "Fill All Fields")
        }
        return false
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
