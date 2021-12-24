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

    
    override func viewWillAppear(_ animated: Bool) {
        mainScreenStackView.configureView()
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
