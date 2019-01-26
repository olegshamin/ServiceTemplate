//
//  DeserializerError.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

enum DeserializerError: Error, LocalizedError {
    case expectedJSONObject
    case expectedJSONArray
    
    var errorDescription: String? {
        switch self {
        case .expectedJSONArray:
            return NSLocalizedString("Invalid response from server. Expected JSON array", comment: "")
        case .expectedJSONObject:
            return NSLocalizedString("Invalid response from server. Expected JSON array", comment: "")
        }
    }
}
