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
    let requestFactory = RequestFactory()
    let controller = LoginViewController(nibName: "LoginViewController", bundle: nil)
    
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
    
    
    
     func textInputed() -> Bool {
        guard self.loginTextField.text != "",
              self.passwordTextField.text != "" else {
                  return false
              }
        return true
    }
    
    
    
    // MARK: -- Success & Error Messages.
    private func transferToMainScreen() {
        let mainScreenViewController = controller.storyboard?.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        controller.navigationController?.pushViewController(mainScreenViewController, animated: true)
    }
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Authorisation error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    // MARK: -- Actions.
    @IBAction func loginButtonTapped(_ sender: Any) {
        if textInputed() {
        let factory = requestFactory.makeAuthRequestFactory()
            let authUser = AuthUser(userLogin: self.loginTextField.text!, userPassword: self.passwordTextField.text!)
        
        factory.login(userLogin: authUser.userLogin, userPassword: authUser.userPassword) { response in
            DispatchQueue.main.async {
                logging(Logger.funcStart)
                logging(response)
                
                switch response.result {
                case .success(let success): success.result == 1 ? self.transferToMainScreen() : self.showError("Authorisation error")
                case .failure(let error): self.showError(error.localizedDescription)
                }
                
                logging(Logger.funcEnd)
            }
        }
        } else {
            self.showError("Login or password not filled")
        }
            
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let registrationViewController = controller.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        controller.present(registrationViewController, animated: true, completion: nil)
    }
}
