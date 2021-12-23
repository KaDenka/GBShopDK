//
//  LoginStackView.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 23.12.2021.
//

import UIKit

class LoginStackView: UIStackView {
    
    @IBOutlet weak var shopLogo: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    var model = LoginViewModel()
   
    
    func configureView() {
        shopLogo.image = model.shopLogo
        loginLabel.text = model.loginLabel
        passwordLabel.text = model.passwordLabel
        descriptionLabel.text = model.descriptionAppLabel
        
        loginButton.titleLabel?.text = model.loginButtonLabel
        registrationButton.titleLabel?.text = model.registrationButtonLabel
        
        loginTextField.placeholder = model.loginTextFieldPlaceholder
        passwordTextField.placeholder = model.passwordTextFieldPlaceholder
    }
    
    
    
     
    
}
