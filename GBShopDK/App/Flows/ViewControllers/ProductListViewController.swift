//
//  ProductListViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 27.12.2021.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var productListTableView: UITableView!
    
    let requestFactory = RequestFactory()
    var tableModel = ProductListViewModel()
    var productList: [Product] = []
    
    private func setupConstraints() {
        self.view.addSubview(productListTableView)
        self.productListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.productListTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.productListTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.productListTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.productListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.productListTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.productListTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
//        cell.configureCell()
//        cell.productName.text = productList[indexPath.row].productName
//        cell.productPrice.text = String(productList[indexPath.row].productPrice)
       cell.productDescription.text = productList[indexPath.row].productDescription
        cell.textLabel?.text = "have cell"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(self.tableModel.productListLabel) \(self.tableModel.countLabel)"
    }
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Registration error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func fillTable() {
        let factory = requestFactory.makeProductsFactory()
        let request = GetProductList(pageNumber: 1, categoryId: 1)
        factory.productList(pageNumber: request.pageNumber, categoryId: request.categoryId) { response in
            DispatchQueue.main.async {
                logging(Logger.funcStart)
                logging(response)
                
                switch response.result {
                case .success(let success):
                    self.productList = success.productList
                    self.tableModel.countLabel = self.tableModel.countLabel + String(success.count)
                    self.productListTableView.reloadData()
                case .failure(let error):
                    self.showError(error.localizedDescription)
                }
                
                logging(Logger.funcEnd)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productListTableView.delegate = self
        productListTableView.dataSource = self
        setupConstraints()
        productListTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
        self.fillTable()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello catalog")
    }
    
    
}
