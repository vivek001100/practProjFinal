//
//  ApiInterface.swift
//  PracProj
//
//  Created by VM on 24/03/23.
//

import Foundation

class Urls {
    //BASE URL
    static private let baseUrl = URL(string: "https://c8b1-2409-4053-619-ae2-d9d6-f687-a237-6e2d.in.ngrok.io")
    
    //GET URLS STRINGS
    static private let getAllProductsPath = "/api/product/all"
    static private let getAllCartProductsPath = "/api/cart/products"
    static private let getProductDetailPath = "/api/product/{id}"
    static private let getUserDetailPath = "/api/auth/getDetail"
    //POST URLS STRING
    static private let loginPath = "/api/auth/login"
    static private let signupPath = "/api/auth/register"
    static private let addToCartPath = "/api/cart/add"
    static private let updateQuantityPath = "/api/cart/update"
    static private let deleteCartProductPath = "/api/cart/delete"
    static private let placeOrderPath = "/api/order/place"
    
    //URLS
    static let getAllProductsUrl = URL(string: getAllProductsPath,relativeTo: baseUrl)
    static let getUserDetailUrl = URL(string: getUserDetailPath,relativeTo: baseUrl)
    static let getProductDetailUrl = URL(string: getProductDetailPath,relativeTo: baseUrl)
    static let getAllCartProductsUrl = URL(string: getAllCartProductsPath,relativeTo: baseUrl)
    
    static let loginUrl = URL(string: loginPath,relativeTo: baseUrl)
    static let signupUrl = URL(string: signupPath,relativeTo: baseUrl)
    static let addToCartUrl = URL(string: addToCartPath,relativeTo: baseUrl)
    static let updateQuantityUrl = URL(string: updateQuantityPath,relativeTo: baseUrl)
    static let deleteCartProductUrl = URL(string: deleteCartProductPath,relativeTo: baseUrl)
    static let placeOrderUrl = URL(string: placeOrderPath,relativeTo: baseUrl)
}




