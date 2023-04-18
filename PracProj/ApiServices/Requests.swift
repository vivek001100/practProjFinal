//
//  Requests.swift
//  PracProj
//
//  Created by VM on 25/03/23.
//

import Foundation

class Requests{
   static func getProductRequest() async-> ProductsListResponse{
        do{
            let (data,_) = try await URLSession.shared.data(from: Urls.getAllProductsUrl!)
            return try JSONDecoder().decode(ProductsListResponse.self, from: data)
        }
            catch{
                print("failed to fetch products \(error)")
                return ProductsListResponse(products: [])
            }
        }
    
    }

