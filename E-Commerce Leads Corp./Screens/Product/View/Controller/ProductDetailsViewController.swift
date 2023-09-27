//
//  ProductDetailsViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 25/9/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    var product: Products?
    var quantity = 1
    var cartBadgeView: BadgeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateViewWithProductInfo()
        configCartBadgeView()
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        
        quantity = max(1, quantity - 1)
        productQuantityLabel.text = String(quantity)
        productPriceLabel.text = "\((product?.price ?? 0) * Double(quantity))"
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        
        quantity += 1
        productQuantityLabel.text = String(quantity)
        productPriceLabel.text = "\((product?.price ?? 0) * Double(quantity))"
        
    }
    
    @IBAction func addToCartButtonPressed(_ sender: UIButton) {
        
        guard let product = self.product else {
            return
        }
        
        Cart.shared.addItem(product)
        
        cartBadgeView.badgeValue = 11
        
        let alert = UIAlertController(title: "Success", message: "Product added to cart.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cartButtonPressed(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "goToCartVC", sender: .none)
    }
    
}

extension ProductDetailsViewController {
    
    func populateViewWithProductInfo() {
        
        if let imageURL = URL(string: product?.image ?? "") {
            
            productTitleLabel.text = product?.title
            productCategoryLabel.text = "Category"
            productPriceLabel.text = "$\(product?.price ?? 0)"
            productDescriptionLabel.text = product?.description

            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageURL),
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.productImageView.image = image
                    }
                }
            }
        }
    }
}

extension ProductDetailsViewController {
    
    func configCartBadgeView() {
        // Initialize the cart badge view
        cartBadgeView = BadgeView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        cartBadgeView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    
}
