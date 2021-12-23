//
//  RegistrationViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 23.12.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registrationStackView: RegistrationChangesStackView!
    
    let requestFactory = RequestFactory()
    
    
    //MARK: -- Constraints settings
    private func setupConstraints() {
        self.scrollView.addSubview(registrationStackView)
        self.registrationStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.registrationStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.registrationStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.registrationStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.registrationStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        
        self.registrationStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    //MARK: -- Controls settings
    private func setupControls() {
        self.registrationStackView.registrationButton.backgroundColor = UIColor.opaqueSeparator
        self.registrationStackView.registrationButton.isEnabled = false
        
        [self.registrationStackView.userIdTextField,
         self.registrationStackView.userLoginTextField,
         self.registrationStackView.userPasswordTextField,
         self.registrationStackView.userFirstNameTextField,
         self.registrationStackView.userLastNameTextField,
         self.registrationStackView.userEmailTextField,
         self.registrationStackView.userCreditCardTextField,
         self.registrationStackView.userBioTextField
        ].forEach {
            $0.addTarget(self, action: #selector(self.editingChanged), for: .editingChanged)
        }
    }
    
    //MARK: -- Notifications settings
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
    
    // MARK: -- Selectors
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        contentInset.bottom = keyboardFrame.size.height + 200
        self.scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        guard self.textInputed() else {
            self.registrationStackView.registrationButton.backgroundColor = UIColor.opaqueSeparator
            self.registrationStackView.registrationButton.isEnabled = false
            return
        }
        
        self.registrationStackView.registrationButton.backgroundColor = UIColor.systemCyan
        self.registrationStackView.registrationButton.isEnabled = true
    }
    
    //MARK: -- Boolean func for textField filling
    func textInputed() -> Bool {
        guard
            self.registrationStackView.userIdTextField.text != "",
             self.registrationStackView.userLoginTextField.text != "",
             self.registrationStackView.userPasswordTextField.text != "",
             self.registrationStackView.userFirstNameTextField.text != "",
             self.registrationStackView.userLastNameTextField.text != "",
             self.registrationStackView.userEmailTextField.text != "",
             self.registrationStackView.userCreditCardTextField.text != "",
             self.registrationStackView.userBioTextField.text != ""
        else {
                  return false
              }
        return true
    }
    
    
    
    
    
    
    
    //MARK: -- ViewController functions
    override func viewWillAppear(_ animated: Bool) {
        setupConstraints()
        registrationStackView.configView()
        setupControls()
        registerNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
