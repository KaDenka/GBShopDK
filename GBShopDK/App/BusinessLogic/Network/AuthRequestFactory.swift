//
//  AuthRequestFactory.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 03.12.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    
}

