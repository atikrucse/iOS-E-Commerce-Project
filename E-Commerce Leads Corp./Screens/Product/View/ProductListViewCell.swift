//
//  ProductListViewCell.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 25/9/23.
//

import UIKit

class ProductListViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productListBackgroundView: UIView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productRatingButton: UIButton!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var categoryName: String?
    var product: Products? {
        didSet {
            productDetailsConfig()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailsConfig(){
        
        guard let product else { return }
        
        productTitleLabel.text = product.title
        productCategoryLabel.text = categoryName
        productRatingButton.setTitle("\(product.rating)", for: .normal)
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "$\(product.price)"
        
        if let imageURL = URL(string: product.image) {

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
