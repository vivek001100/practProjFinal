//
//  MyCollectionViewCell.swift
//  PracProj
//
//  Created by VM on 20/03/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    weak var delegate: AlertProtocol?
    static let identifier = "MyCollectionViewCell"
   private var index = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(index)
        indexLabel.text = "\(index+1)"
        // Initialization code
    }
    public func configure(index : Int){
        self.index = index
        indexLabel.text = "\(index+1)"
    }
    @IBAction func alertBtn(_ sender: UIButton) {
       

        
        let alert = UIAlertController(title: "label \(index+1) click", message: "Hello", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
        
        delegate?.showAlert(alert: alert)
    }
}

protocol AlertProtocol: AnyObject{
    func showAlert(alert: UIAlertController)
}
