//
//  LoginViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 23.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginStackView: LoginStackView!
   
    
  
   
    
   
    
    private func setupConstraints() {
        self.scrollView.addSubview(loginStackView)
        self.loginStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.loginStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.loginStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.loginStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.loginStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        
        self.loginStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    private func setupControls() {
        self.loginStackView.loginButton.backgroundColor = UIColor.opaqueSeparator
        self.loginStackView.loginButton.isEnabled = false
        
        [self.loginStackView.loginTextField, self.loginStackView.passwordTextField].forEach {
            $0.addTarget(self, action: #selector(self.editingChanged), for: .editingChanged)
        }
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
        self.scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        guard self.loginStackView.textInputed() else {
            self.loginStackView.loginButton.backgroundColor = UIColor.opaqueSeparator
            self.loginStackView.loginButton.isEnabled = false
            return
        }
        
        self.loginStackView.loginButton.backgroundColor = UIColor.systemCyan
        self.loginStackView.loginButton.isEnabled = true
    }
    
    
    // MARK: -- LoginViewController functions.
    
    override func viewWillAppear(_ animated: Bool) {
        loginStackView.configureView()
        setupConstraints()
        setupControls()
        registerNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
