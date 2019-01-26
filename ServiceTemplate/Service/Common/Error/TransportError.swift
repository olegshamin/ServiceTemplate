//
//  TransportError.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

enum TransportError: Error, LocalizedError {
    case requestFailed(underlyingError: Error)
    case invalidResponse
    case internalServerError
    
    var errorDescription: String? {
        switch self {
        case .requestFailed(let underlyingError):
            return .localizedStringWithFormat("Network request failed. %@", underlyingError.localizedDescription)
        case .invalidResponse:
            return NSLocalizedString("Invalid response from server", comment: "")
        case .internalServerError:
            return NSLocalizedString("Internal server error", comment: "")
        }
    }
}
