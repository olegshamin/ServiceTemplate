//
//  SerializerError.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

enum SerializerError: Error, LocalizedError {
    case cantSerializeObject(withType: Any.Type)
    
    var errorDescription: String? {
        switch self {
        case .cantSerializeObject(let type):
            let formatString = "Can't serialize object with type '%@'"
            return .localizedStringWithFormat(formatString, "\(type)")
        }
    }
}
