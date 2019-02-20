//
//  FakeDataTransport.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class FakeDataTransport: Transport {
    
    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func perform(urlRequest: URLRequest,
                 completion: @escaping TransportResponseResultHandler) {
        guard let url = urlRequest.url,
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil) else {
                completion(.failure(TransportError.invalidResponse))
                return
        }
        completion(.success(TransportResponse(data: data, response: response)))
    }
}
