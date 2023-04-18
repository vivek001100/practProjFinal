//
//  SecondCollectionViewCell.swift
//  PracProj
//
//  Created by VM on 21/03/23.
//

import UIKit


class SecondCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productPriceLabel2: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBtnLabel: UIButton!

    static let identifier = "SecondCollectionViewCell"
    
    var productViewModel: ProductCollectionViewModel!{
        didSet{
            productNameLabel.text = productViewModel.name
            productPriceLabel.text = productViewModel.actualPrice
            productPriceLabel2.text = productViewModel.discountedPrice
            productCategoryLabel.text = productViewModel.category
            setImage(from: productViewModel.imageUrl)
            productBtnLabel.setTitle("Add to Cart", for:.normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func productBtn(_ sender: Any) {
        if(productBtnLabel.title(for: .normal) == "Add to Cart"){
            productBtnLabel.setTitle("Go to Cart", for: .normal)
            productBtnLabel.tintColor = .darkGray
        }
        else
        {
            productBtnLabel.setTitle("Add to Cart", for:.normal)
            productBtnLabel.tintColor = .tintColor
        }
    }
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                self.productImage.image = image
            }
        }
    }
    
    

}
