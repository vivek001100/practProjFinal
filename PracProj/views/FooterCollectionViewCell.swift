//
//  FooterCollectionViewCell.swift
//  PracProj
//
//  Created by VM on 29/03/23.
//

import UIKit

class FooterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pageController: UIPageControl!
    static let identifier = "FooterCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib()-> UINib{
        return UINib(
            nibName: FooterCollectionViewCell.identifier,
            bundle: nil
        )
    }
    
    func config(noOfPage: Int, currentPage: Int){
        print(noOfPage,currentPage)
        pageController.numberOfPages = noOfPage
        pageController.currentPage = currentPage
    }

}
class HeaderCollectionViewCell: UICollectionReusableView{
    static let indentifier = "HeaderCollectionViewCell"
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Section 1"
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
