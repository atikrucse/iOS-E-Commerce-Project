//
//  CartViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 26/9/23.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var cartProducts: [Products]?
    var totalPrice : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartProducts = Cart.shared.items
        totalPrice = Cart.shared.getTotalPrice()
        totalPriceLabel.text = "\(totalPrice)"
        
        tableView.register(UINib(nibName: "CartListViewCell", bundle: nil), forCellReuseIdentifier: "CartListViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        Cart.shared.delegate = self
    }

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToRegestrationVC", sender: .none)
    }
}

extension CartViewController: UITableViewDelegate {
    
}

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartListViewCell", for: indexPath) as? CartListViewCell else {
            return UITableViewCell()
        }
        
        let product = cartProducts?[indexPath.row]
        cell.cartProduct = product
        cell.index = indexPath.row
        
        return cell
    }
}

extension CartViewController: CartDelegate {
    
    func cartDidUpdate() {
        
        cartProducts = Cart.shared.items
        totalPrice = Cart.shared.getTotalPrice()
        totalPriceLabel.text = "\(totalPrice)"
        tableView.reloadData()
    }
}

