//
//  JSONDeserializer.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class JSONDeserializer: Deserializer {
    
    func deserialize(data: Data) throws -> ModelDictionary {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let modelDictionary = json as? ModelDictionary else {
            throw DeserializerError.expectedJSONObject
        }
        return modelDictionary
    }
    
    func deserializeArray(data: Data) throws -> [ModelDictionary] {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionaries = json as? [ModelDictionary] else {
            throw DeserializerError.expectedJSONArray
        }
        return dictionaries
    }
}
