//
//  Services.swift
//  TestesiOS
//
//  Created by Igor Fortti on 14/09/23.
//

import Foundation

enum ChucknorrisError: Error {
    case noData
    case invalidResponse
}

protocol ServicesProtocol {
    func fetchChucknorrisCategories(completion: @escaping ([String]?, ChucknorrisError?) -> ())
}

class Services: ServicesProtocol {
    
    func fetchChucknorrisCategories(completion: @escaping ([String]?, ChucknorrisError?) -> ()) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/categories")
        else {
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if error != nil {
                completion(nil, .noData)
            }
            
            if let data = data {
                do {
                    let categories = try JSONDecoder().decode([String].self, from: data)
                    completion(categories, nil)
                } catch {
                    completion(nil, .invalidResponse)
                }
            }
        }.resume()
    }
}
