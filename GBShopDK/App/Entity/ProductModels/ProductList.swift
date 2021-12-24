//
//  ProductList.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 07.12.2021.
//

import Foundation

struct ProductList: Codable {
    let count: Int
    let productList: [Product]
}
