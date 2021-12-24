//
//  ProductsRequestFactory.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 07.12.2021.
//

import Foundation
import Alamofire

protocol ProductsRequestFactory {
    func productList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[ProductList]>) -> Void)
    func product(idProduct: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void)
}
