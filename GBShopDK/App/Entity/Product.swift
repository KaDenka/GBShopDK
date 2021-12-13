//
//  Product.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 07.12.2021.
//

import Foundation

struct Product: Codable {
    let productPrice: Int
    let productName: String
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
            case productPrice
            case productName
            case productDescription
        }
}
