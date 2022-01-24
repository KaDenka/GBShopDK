//
//  CartSingletone.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 19.01.2022.
//

import Foundation

class CartSingletone {
    var cartList: [Product] = []
    
    static let shared = CartSingletone()
    private init(){}
}
