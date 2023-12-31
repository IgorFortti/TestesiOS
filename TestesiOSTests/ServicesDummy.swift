//
//  ServicesDummy.swift
//  TestesiOSTests
//
//  Created by Igor Fortti on 15/09/23.
//

@testable import TestesiOS

enum Status {
    case success
    case noDate
    case invalidResponse
}

class ServicesDummy: ServicesProtocol {
    
    let status: Status
    
    init(status: Status) {
        self.status = status
    }
    
    func fetchChucknorrisCategories(completion: @escaping ([String]?, ChucknorrisError?) -> ()) {
        switch status {
        case .success:
            completion(["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"], nil)
        case .noDate:
            completion(nil, .noData)
        case .invalidResponse:
            completion(nil, .invalidResponse)
        }
    }
}
