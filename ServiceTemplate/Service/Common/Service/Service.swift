//
//  Service.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

// Base protocol for services
protocol Service: class {}

/// Contains helpers for handling completion blocks to avoid code duplication
/// and so that all completion blocks are handled in one place
extension Service {
    func handle<T>(result: Result<T>, scheduler: Scheduler, completion: @escaping ResultHandler<T>) {
        scheduler.doOnMainThread {
            completion(result)
        }
    }
    
    func handle<T>(error: Error, scheduler: Scheduler, completion: @escaping ResultHandler<T>) {
        scheduler.doOnMainThread {
            completion(.failure(error))
        }
    }
    
    /// Checks if the network error is a transport error, e.g. network unreachable
    /// If it is, calls fallback block, usually used for database fetching
    /// Otherwise (e.g. mapping error), calls the completion block with error
    ///
    /// - Parameters:
    ///   - networkError: Network error returned from the network repository
    ///   - scheduler: Scheduler for handling completion block
    ///   - completion: Completion block to call in case of error, if it wasn't a transport error
    ///   - fallback: Fallback block to call in case of transport error.
    func handle<T>(
        networkError: Error,
        scheduler: Scheduler,
        completion: @escaping ResultHandler<T>,
        fallback: () -> Void
        ) {
        guard case TransportError.requestFailed = networkError else {
            handle(error: networkError, scheduler: scheduler, completion: completion)
            return
        }
        fallback()
    }
}
