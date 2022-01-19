//
//  CartViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 19.01.2022.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var payCartButton: UIButton!
    
    let factory = RequestFactory()
    let cellId = "CartCell"
    
    private func firstConfiguration() {
        self.navigationItem.title = "Cart"
        if CartSingletone.shared.cartList.count > 0 {
            payCartButton.isHidden = false
        } else {
            payCartButton.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        firstConfiguration()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CartSingletone.shared.cartList.count > 0 {
            return CartSingletone.shared.cartList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
        if CartSingletone.shared.cartList.count > 0 {
            cell.textLabel?.text = CartSingletone.shared.cartList[indexPath.row].productName
            return cell
        } else {
            cell.textLabel?.text = "Cart have no any items!"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    // Устанавливаем заголовок левой скользящей кнопки по умолчанию
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    // Срабатывает при нажатии кнопки, которая появляется при левом смахивании
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        CartSingletone.shared.cartList.remove(at: indexPath.row)
        self.tableView.reloadData()
        if CartSingletone.shared.cartList.count == 0 {
            payCartButton.isHidden = true
        }
        return
    }
}
