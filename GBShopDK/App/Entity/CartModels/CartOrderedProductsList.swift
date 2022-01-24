//
//  CartOrderedProductsList.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 18.12.2021.
//

import Foundation

struct CartOrderedProductsList: Codable {
    let count: Int
    let productsInCartList: [CartProduct]
}
