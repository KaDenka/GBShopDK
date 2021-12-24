//
//  AuthRequestFactory.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 03.12.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userLogin: String, userPassword: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func logout(userLogin: String, userPassword: String, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

