//
//  Cart.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 26/9/23.
//

import Foundation

protocol CartDelegate: AnyObject {
    func cartDidUpdate()
}

class Cart {
    static let shared = Cart()
    private init() {}
    
    var items: [Products] = []
    weak var delegate: CartDelegate?
    
    func addItem(_ product: Products) {
        items.append(product)
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
        delegate?.cartDidUpdate()
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    func getTotalPrice() -> Double {
        return items.reduce(0.0) { $0 + $1.price }
    }
}

