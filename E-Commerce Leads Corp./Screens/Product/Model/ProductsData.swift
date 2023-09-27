//
//  Product.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 24/9/23.
//

import Foundation

struct ProductsData: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let categoryName: String
    let categoryImg: String
    let products: [Products]
}

struct Products: Decodable {
    let id: Int
    let title: String
    let description: String?
    let price: Double
    let image: String
    let quantity: Int
    let color: String
    let rating: String
}


