//
//  ProductCollectionViewModel.swift
//  PracProj
//
//  Created by VM on 23/03/23.
//

import UIKit

struct ProductCollectionViewModel{
    let name: String
    let actualPrice: String
    let discountedPrice : String
    let category: String
    let imageUrl: String
    
    init(with product: Product){
        self.name = product.name
        self.actualPrice = product.price
        self.discountedPrice = product.price
        self.category = product.category
        self.imageUrl = product.image
    }
}
