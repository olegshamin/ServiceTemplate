//
//  AlamofireTransport.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation
import Alamofire

private extension TimeInterval {
    static let requestTimeout: TimeInterval = 20
}

/// Implementation of transport protocol using Alamofire.
final class AlamofireTransport: Transport {
    
    // MARK: Private Properties
    
    private let sessionManager: SessionManager
    
    // MARK: Initialization
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = .requestTimeout
        sessionManager = SessionManager(
            configuration: configuration
        )
    }
    
    // MARK: Transport
    
    func perform(urlRequest: URLRequest, completion: @escaping TransportResponseResultHandler) {
        sessionManager.request(urlRequest).responseData { [weak self] response in
            self?.handle(transportResponse: response, completion: completion)
        }
    }
    
    // MARK: Private Helpers
    
    private func handle(
        transportResponse: DataResponse<Data>,
        completion: @escaping TransportResponseResultHandler
        ) {
        switch transportResponse.result {
        case .success(let data):
            guard let response = transportResponse.response else {
                completion(.failure(TransportError.invalidResponse))
                return
            }
            completion(.success(TransportResponse(data: data, response: response)))
        case .failure(let error):
            let requestError = TransportError.requestFailed(underlyingError: error)
            completion(.failure(requestError))
        }
    }
}
