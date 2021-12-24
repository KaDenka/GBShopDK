//
//  LogoutResult.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 05.12.2021.
//

import Foundation

struct DefaultResult: Codable {
    let result: Int
    let userMessage: String?
    let errorMessage: String?
}
