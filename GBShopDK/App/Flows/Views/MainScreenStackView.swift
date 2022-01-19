//
//  MainScreenStackView.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 24.12.2021.
//

import UIKit

class MainScreenStackView: UIStackView {
    
    @IBOutlet weak var wellcomeLabel: UILabel!
    @IBOutlet weak var changeDataButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var productListButton: UIButton!
    
    let model = MainScreenModel()
    
    //MARK: -- Configuration function
    func configureView() {
        wellcomeLabel.text = model.wellcomeLabel
        changeDataButton.titleLabel?.text = model.changeDataButtonLabel
        logoutButton.titleLabel?.text = model.logoutButtonLabel
        productListButton.titleLabel?.text = model.productsListButtonLabel
    }
    
}
