//
//  ProductListViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 28.12.2021.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var productTableView: ProductTableView!
    
    let cellId = "productTableViewCell"
    let factory = RequestFactory()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: cellId) as! ProductTableViewCell
        cell.productName.text = "have cell"
        return cell
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        self.productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
