//
//  ViewController.swift
//  PracProj
//
//  Created by VM on 14/03/23.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.setTitle("Navigate to 2", for: .normal)
       
        // Do any additional setup after loading the view.
    }
    @IBAction func btnOnTap(_ sender: Any) {
        self.performSegue(withIdentifier: "navigate", sender: self)
    }
}

