//
//  MapperError.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

enum MapperError: Error, LocalizedError {
    case valueMissing(forKey: String)
    case typeMismatch(forKey: String, expected: Any.Type, got: Any.Type)
    
    public var errorDescription: String? {
        let message: String
        switch self {
        case .valueMissing(let key):
            message = .localizedStringWithFormat("Value missing for key '%@'", key)
        case .typeMismatch(let key, let expected, let got):
            let formatString = "Value mismatch for key '%@'. Expected: '%@'. Got '%@'"
            message = .localizedStringWithFormat(formatString, key, "\(expected)", "\(got)")
        }
        return .localizedStringWithFormat("Mapper error. %@", message)
    }
}
