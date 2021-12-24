//
//  ProductsRequests.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 07.12.2021.
//

import Foundation
import Alamofire


class ProductsRequests: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init (errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProductsRequests:  ProductsRequestFactory {
    func productList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[ProductList]>) -> Void) {
        let requestModel = ProductListRequest(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func product(idProduct: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void) {
        let requestModel = ProductRequest(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductsRequests {
    struct ProductListRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        let idCategory: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory,
            ]
        }
    }
}

extension ProductsRequests {
    struct ProductRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
            ]
        }
    }
}
