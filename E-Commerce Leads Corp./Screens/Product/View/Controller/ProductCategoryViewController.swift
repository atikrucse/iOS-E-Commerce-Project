//
//  ProductCategoryViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 25/9/23.
//

import UIKit

class ProductCategoryViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    private var viewModel = ProductViewModel()
    var category: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        configuration()
    }
}

extension ProductCategoryViewController {
    
    func configuration() {
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    // Observe Data Binding event - Communication
    func observeEvent() {
        
        viewModel.eventHandler = { [weak self] event in
            
            guard let self else { return }
            
            switch event {
                case .loading:
                    break
                case .stopLoading:
                    break
                case .dataLoaded:
                    category = viewModel.category
                    DispatchQueue.main.async {
                        self.myCollectionView.reloadData()
                    }

                case .error(let error):
                    print(error)
            }
        }
    }
}

extension ProductCategoryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedProduct = category[indexPath.item]

        performSegue(withIdentifier: Constant.K.goProductListVC, sender: selectedProduct)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let productListVC = segue.destination as? ProductListViewController,

            let selectedCategory = sender as? Category {

            productListVC.category = selectedCategory
        }
    }
}

extension ProductCategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! ProductCategoryCollectionViewCell
        
        let category = category[indexPath.item]
       
        cell.categoryName.text = category.categoryName
        cell.totalProductInCategory.text = "Total \(category.products.count) Items"
        if let imageURL = URL(string: category.categoryImg) {

            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageURL),
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.categoryImage.image = image
                        cell.setNeedsLayout()
                    }
                }
            }
        }
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGray6.cgColor
        
        return cell
    }
}

extension ProductCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - 20)/2
        
        return CGSize(width: size, height: size)
    }
}
