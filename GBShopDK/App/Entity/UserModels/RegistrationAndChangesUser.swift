//
//  RegistrationAndChangesUser.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 23.12.2021.
//

import Foundation

struct RegistrationAndChangesUser: Codable {
    var userId: Int
    var userLogin: String
    var userPassword: String
    var userName: String
    var userLastname: String
    var userEmail: String
    var userCreditCard: String
    var userBio: String
}
