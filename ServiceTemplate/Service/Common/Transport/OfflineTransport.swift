//
//  OfflineTransport.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class OfflineTransport: Transport {
    
    // MARK: - Transport
    
    func perform(urlRequest: URLRequest, completion: @escaping TransportResponseResultHandler) {
        let error = TransportError.requestFailed(underlyingError: TransportError.invalidResponse)
        completion(.failure(error))
    }
}
