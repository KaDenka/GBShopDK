//
//  LoginViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 23.12.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    let requestFactory = RequestFactory()
    var model = LoginViewModel()
    
    private func configureView() {
        loginLabel.text = model.loginLabel
        passwordLabel.text = model.passwordLabel
        descriptionLabel.text = model.descriptionAppLabel
        
        loginButton.titleLabel?.text = model.loginButtonLabel
        registrationButton.titleLabel?.text = model.registrationButtonLabel
        
        loginTextField.placeholder = "Input Login"
        passwordTextField.placeholder = "Input Password"
    }
    
    private func setupConstraints() {
        self.scrollView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        
        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    private func setupControls() {
        loginButton.backgroundColor = UIColor.opaqueSeparator
        loginButton.isEnabled = false
        
        [loginTextField, passwordTextField].forEach {
            $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
    }
    
    private func textInputed() -> Bool {
        guard loginTextField.text != "",
              passwordTextField.text != "" else {
                  return false
              }
        return true
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    // MARK: -- Selectors.
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        contentInset.bottom = keyboardFrame.size.height + 50
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        guard textInputed() else {
            loginButton.backgroundColor = UIColor.opaqueSeparator
            loginButton.isEnabled = false
            return
        }
        
        loginButton.backgroundColor = UIColor.systemOrange
        loginButton.isEnabled = true
    }
    
    // MARK: -- Success & Error Messages.
    private func transferToMainScreen() {
        let mainScreenViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        navigationController?.pushViewController(mainScreenViewController, animated: true)
    }
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Authorisation error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: -- Actions.
    @IBAction func loginButtonTapped(_ sender: Any) {
        if textInputed() {
        let factory = requestFactory.makeAuthRequestFactory()
        let authUser = AuthUser(userLogin: loginTextField.text!, userPassword: passwordTextField.text!)
        
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
        let registrationViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.present(registrationViewController, animated: true, completion: nil)
    }
    
    
    // MARK: -- LoginViewController functions.
    
    override func viewWillAppear(_ animated: Bool) {
        configureView()
        setupConstraints()
        setupControls()
        registerNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
