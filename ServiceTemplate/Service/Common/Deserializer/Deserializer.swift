//
//  Deserializer.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

typealias ModelDictionary = [String: Any]

/// Protocol for deserializing binary data to [String: Any] dictionary.
/// Example: JSONDeserializer, XMLDeserializer etc.
protocol Deserializer {
    func deserialize(data: Data) throws -> ModelDictionary
    func deserializeArray(data: Data) throws -> [ModelDictionary]
}
