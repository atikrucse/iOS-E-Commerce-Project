//
//  ProductListViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 25/9/23.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: Category?
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: Constant.K.ProductListViewCell, bundle: nil), forCellReuseIdentifier: Constant.K.ProductListViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()

    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedProduct = category?.products[indexPath.item]

        performSegue(withIdentifier: Constant.K.goToProductDetailsVC, sender: selectedProduct)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let productListVC = segue.destination as? ProductDetailsViewController,

            let selectedCategory = sender as? Products {

            productListVC.product = selectedCategory
        }
    }
    
}

extension ProductListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return category?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.K.ProductListViewCellIdentifier, for: indexPath) as? ProductListViewCell else {
            return UITableViewCell()
        }
        
        let product = category?.products[indexPath.row]
        cell.categoryName = category?.categoryName
        cell.product = product
        
        return cell
    }
}
