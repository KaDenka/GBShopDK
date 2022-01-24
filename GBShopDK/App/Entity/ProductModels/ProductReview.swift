//
//  ProductReview.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 16.12.2021.
//

import Foundation

struct ProductReview: Codable {
    let reviewId: Int
    let userName: String
    let productRating: Int
    let userReview: String
}
