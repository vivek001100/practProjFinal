//
//  ThirdViewController.swift
//  PracProj
//
//  Created by VM on 16/03/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet var btn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }
    @IBAction func btnOnTap(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

