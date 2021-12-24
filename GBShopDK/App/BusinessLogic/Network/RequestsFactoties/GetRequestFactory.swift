//
//  GetRequestFactory.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 24.12.2021.
//

import Foundation
import Alamofire

protocol GetRequestFactory {
    func getUserData(request: String, completionHandler: @escaping (AFDataResponse<RegistrationAndChangesUser>) -> Void)
}
