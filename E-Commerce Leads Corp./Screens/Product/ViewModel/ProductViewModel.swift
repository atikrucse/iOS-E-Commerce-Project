//
//  ProductViewModel.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 24/9/23.
//

import Foundation

final class ProductViewModel {
    
    var category: [Category] = []
    
    var eventHandler: ((_ event: Event) -> Void)?  //Data Binding Closure
    
    func fetchProducts() {
        
        self.eventHandler?(.loading)
        APIManager.shared.fetchProduct { response in
            
            self.eventHandler?(.stopLoading)
            
            switch response {
                case .success(let categoryResponse):
                self.category = categoryResponse.categories
                    self.eventHandler?(.dataLoaded)

                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
            
        }
    }
}

extension ProductViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
