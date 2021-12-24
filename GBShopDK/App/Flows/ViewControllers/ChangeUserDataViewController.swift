//
//  ChangeUserDataViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 24.12.2021.
//

import UIKit

class ChangeUserDataViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var changeDataStackView: RegistrationChangesStackView!
    
    let requestFactory = RequestFactory()
    
    //MARK: -- Constraints settings
    private func setupConstraints() {
        self.scrollView.addSubview(changeDataStackView)
        self.changeDataStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.changeDataStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.changeDataStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.changeDataStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.changeDataStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        
        self.changeDataStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    //MARK: -- Controls settings
    private func setupControls() {
        self.changeDataStackView.registrationButton.backgroundColor = UIColor.opaqueSeparator
        self.changeDataStackView.registrationButton.isEnabled = false
        
        [self.changeDataStackView.userIdTextField,
         self.changeDataStackView.userLoginTextField,
         self.changeDataStackView.userPasswordTextField,
         self.changeDataStackView.userFirstNameTextField,
         self.changeDataStackView.userLastNameTextField,
         self.changeDataStackView.userEmailTextField,
         self.changeDataStackView.userCreditCardTextField,
         self.changeDataStackView.userBioTextField
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
            self.changeDataStackView.registrationButton.backgroundColor = UIColor.opaqueSeparator
            self.changeDataStackView.registrationButton.isEnabled = false
            return
        }
        
        self.changeDataStackView.registrationButton.backgroundColor = UIColor.systemCyan
        self.changeDataStackView.registrationButton.isEnabled = true
    }
    
    //MARK: -- Boolean func for textField filling
    func textInputed() -> Bool {
        guard
            self.changeDataStackView.userIdTextField.text != "",
            self.changeDataStackView.userLoginTextField.text != "",
            self.changeDataStackView.userPasswordTextField.text != "",
            self.changeDataStackView.userFirstNameTextField.text != "",
            self.changeDataStackView.userLastNameTextField.text != "",
            self.changeDataStackView.userEmailTextField.text != "",
            self.changeDataStackView.userCreditCardTextField.text != "",
            self.changeDataStackView.userBioTextField.text != ""
        else {
            return false
        }
        return true
    }
    
    //MARK: -- Transfer functions
    private func transferToMainScreen() {
        
        let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        navigationController?.pushViewController(mainViewController, animated: true)
        
        clearScreen()
    }
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Registration error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: -- Clear screen
    
    private func clearScreen() {
        self.changeDataStackView.userIdTextField.text = ""
        self.changeDataStackView.userLoginTextField.text = ""
        self.changeDataStackView.userPasswordTextField.text = ""
        self.changeDataStackView.userFirstNameTextField.text = ""
        self.changeDataStackView.userLastNameTextField.text = ""
        self.changeDataStackView.userEmailTextField.text = ""
        self.changeDataStackView.userCreditCardTextField.text = ""
        self.changeDataStackView.userBioTextField.text = ""
        
        self.changeDataStackView.registrationButton.backgroundColor = UIColor.opaqueSeparator
        self.changeDataStackView.registrationButton.isEnabled = false
    }
    
    //MARK: -- Fill the form after loading
    
    private func firstFillForm() {
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        changeDataStackView.configChangesView()
        setupConstraints()
        setupControls()
        registerNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
}
