//
//  ProductReviewsList.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 16.12.2021.
//

import Foundation

struct ProductReviewsList: Codable {
    let count: Int
    let productReviews: [ProductReview]
}
