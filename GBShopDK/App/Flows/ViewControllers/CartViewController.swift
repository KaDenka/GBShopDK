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
    let cartList = CartSingletone.shared.cartList
    
    private func titleConfiguration() {
        self.navigationItem.title = "Cart"
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        titleConfiguration()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
        cell.textLabel?.text = "Have cell"
        return cell
    }
}
