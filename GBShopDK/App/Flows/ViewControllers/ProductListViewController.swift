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
    var productList: [Product] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   //     let cell =
        return UITableViewCell()
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
        productListTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
        self.fillTable()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello catalog")
        productListTableView.reloadData()
    }
   
    
}
