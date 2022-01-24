//
//  RegistrationAndDataChangesFactory.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 05.12.2021.
//

import Foundation

import Alamofire

protocol RegistrationAndDataChangesFactory {
    func registration(userId: Int, userLogin: String, userPassword: String, userName: String, userLastname: String, userEmail: String, userCreditCard: String, userBio: String, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
    func dataChange(userId: Int, userLogin: String, userPassword: String, userName: String, userLastname: String, userEmail: String, userCreditCard: String, userBio: String, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}
