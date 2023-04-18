//
//  ProductModel.swift
//  PracProj
//
//  Created by VM on 23/03/23.
//

import Foundation
struct ProductsListResponse: Decodable{
    let products: Array<Product>
}

struct Product : Decodable{
    let name: String
    let id: String
    let category: String
    let image: String
    let price: String
}
