//
//  MainScreenViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 23.12.2021.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainScreenStackView: MainScreenStackView!
    
    let requestFactory = RequestFactory()
    
    //MARK: -- Constraints settings
    private func setupConstraints() {
        self.scrollView.addSubview(mainScreenStackView)
        self.mainScreenStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.mainScreenStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.mainScreenStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.mainScreenStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.mainScreenStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        
        self.mainScreenStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    //MARK: -- Transfers
    private func logoutTransfer() {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: -- Buttons Actions
    @IBAction func changeUserDataButtonTapped(_ sender: Any) {
        let changeUserDataViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeUserDataViewController") as! ChangeUserDataViewController
        navigationController?.pushViewController(changeUserDataViewController, animated: true)
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        let userLogin = "123"
        let userPassword = "password"
        
        let factory = requestFactory.makeAuthRequestFactory()
        let authUser = AuthUser(userLogin: userLogin, userPassword: userPassword)
        
        factory.logout(userLogin: authUser.userLogin, userPassword: authUser.userPassword) { response in
            DispatchQueue.main.async {
                logging(Logger.funcStart)
                logging(response)
                
                switch response.result {
                case .success(let success): success.result == 1 ? self.logoutTransfer() : self.showError("Logout error")
                case .failure(let error): self.showError(error.localizedDescription)
                }
                
                logging(Logger.funcEnd)
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        mainScreenStackView.configureView()
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
