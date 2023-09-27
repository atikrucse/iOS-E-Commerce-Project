//
//  CartListViewCell.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 26/9/23.
//

import UIKit

class CartListViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    
    var cartProduct: Products? {
        didSet {
            productDetailsConfig()
        }
    }
    
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        Cart.shared.removeItem(at: index)
    }
    
    func productDetailsConfig(){
        
        guard let cartProduct else { return }
        
        productTitleLabel.text = cartProduct.title
        productPriceLabel.text = "$\(cartProduct.price)"
        productQuantityLabel.text = "\(1)"
        
        if let imageURL = URL(string: cartProduct.image) {

            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageURL),
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.productImageView.image = image
                        self.setNeedsLayout()
                    }
                }
            }
        }
    }
}
