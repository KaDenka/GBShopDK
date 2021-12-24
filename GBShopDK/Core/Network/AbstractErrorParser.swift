//
//  AbstractErrorParser.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 03.12.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
