//
//  LoginViewModel.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 23.12.2021.
//

import Foundation
import UIKit

struct LoginViewModel {
    let shopLogo: UIImage = UIImage(named: "GBShopLogo")!
    let loginLabel: String
    var loginTextField: UITextField
    let passwordLabel: String
    var passwordTextField: UITextField
    let loginButtonLabel: String = "Login"
    let registrationButtonLabel: String = "Registration"
    let descriptionAppLabel: String = "by DK"
}
