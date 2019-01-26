//
//  Dictionary+Mapping.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

extension Dictionary where Key: CustomStringConvertible {
    
    func mapField<T>(withKey key: Key) throws -> T {
        guard let mappedField = self[key] else {
            throw MapperError.valueMissing(forKey: key.description)
        }
        guard let mappedFieldOfType = mappedField as? T else {
            throw MapperError.typeMismatch(
                forKey: key.description,
                expected: T.self,
                got: type(of: mappedField)
            )
        }
        return mappedFieldOfType
    }
    
    func mapOptionalField<T>(withKey key: Key) -> T? {
        return self[key] as? T
    }
}
