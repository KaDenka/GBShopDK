//
//  ProductTableViewCell.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 27.12.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    let model = ProductViewModel()
    
    func configureCell() {
        productNameLabel.text = model.productNameLabel
        productPriceLabel.text = model.productPriceLabel
        productDescriptionLabel.text = model.productDescriptionLabel
    }

}
