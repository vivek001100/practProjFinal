//
//  SecondViewController.swift
//  PracProj
//
//  Created by VM on 15/03/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var navigateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateBtn.setTitle("Navigate to 3", for: .normal)
        // Do any additional setup after loading the view.
    }
    @IBAction func btnOnTapped(_ sender: Any) {
        let storyBoard = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(storyBoard, animated: true)
        
    }
}

