//
//  User.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 03.12.2021.
//

import Foundation

struct User: Codable {
    let userLastname: String
    let userId: Int
    let userLogin: String
    let userName: String
    
    enum CodingKeys: String, CodingKey {
            case userLastname
            case userId
            case userName, userLogin
        }
}
