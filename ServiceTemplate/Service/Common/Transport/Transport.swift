//
//  Transport.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

typealias TransportResponseResult = Result<TransportResponse>
typealias TransportResponseResultHandler = (TransportResponseResult) -> Void

/// Protocol for performing URL requests.
/// Performs requests asynchronously.
/// Completion block is called on success/failure,
/// which contains raw data and HTTPURLResponse object.
protocol Transport: class {
    func perform(urlRequest: URLRequest, completion: @escaping TransportResponseResultHandler)
}

extension Transport {
    func perform(request: Request, completion: @escaping TransportResponseResultHandler) {
        do {
            let urlRequest = try request.asURLRequest()
            perform(urlRequest: urlRequest, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}
