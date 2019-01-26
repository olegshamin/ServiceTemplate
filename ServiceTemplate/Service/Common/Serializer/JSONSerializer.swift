//
//  JSONSerializer.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class JSONSerializer: Serializer {
    
    // MARK: Private Properties
    
    private let encoder: JSONEncoder
    
    // MARK: Properties
    
    init(encoder: JSONEncoder = JSONEncoder()) {
        self.encoder = encoder
    }
    
    // MARK: Serializer
    
    func serialize<T: Encodable>(_ encodable: T) throws -> Data {
        return try JSONEncoder().encode(encodable)
    }
}
