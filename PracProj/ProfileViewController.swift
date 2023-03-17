//
//  ProfileViewController.swift
//  PracProj
//
//  Created by VM on 17/03/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileLabel: UILabel!
    var email : String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let email {
            profileLabel.text = email
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: UIButton) {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.view.window?.rootViewController = loginVC
        self.view.window?.makeKeyAndVisible()
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
