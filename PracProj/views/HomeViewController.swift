//
//  HomeViewController.swift
//  PracProj
//
//  Created by VM on 17/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    var name : String? = nil
    @IBOutlet weak var singleLabel: UILabel!
    @IBOutlet weak var btnToCollection : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
       
        if let name{
            singleLabel.text = "welcome \(name)"
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toCollectionView(_ sender: Any) {
        let collectionViewStoryBoard = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        self.navigationController?.pushViewController(collectionViewStoryBoard, animated: true)
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
