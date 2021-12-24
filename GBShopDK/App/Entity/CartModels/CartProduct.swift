//
//  CartProduct.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 18.12.2021.
//

import Foundation

struct CartProduct: Codable {
    let productQuantity: Int
    let productName: String
    let productId: Int
}
