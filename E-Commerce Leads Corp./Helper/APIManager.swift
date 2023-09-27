//
//  APIManager.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 24/9/23.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<ProductsData, DataError>) -> Void

final class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func fetchProduct(completion: @escaping Handler) {
        
        guard let url = URL(string: Constant.API.productUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let categories = try JSONDecoder().decode(ProductsData.self, from: data)
                completion(.success(categories))
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
}
