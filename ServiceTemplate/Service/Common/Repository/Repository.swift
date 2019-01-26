//
//  Repository.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

import Foundation

/// Base protocol for repositories.
/// Repositories are objects that manage data from different sources (network, database etc.)
protocol Repository: class {}

// Contains helpers for handling completion blocks to avoid code duplication
// and so that all completion blocks are handled in one place
extension Repository {
    func handle<T>(result: Result<T>, completion: @escaping (Result<T>) -> Void) {
        completion(result)
    }
    
    func handle<T>(success value: T, completion: @escaping (Result<T>) -> Void) {
        completion(.success(value))
    }
    
    func handle<T>(error: Error, completion: @escaping (Result<T>) -> Void) {
        completion(.failure(error))
    }
}
