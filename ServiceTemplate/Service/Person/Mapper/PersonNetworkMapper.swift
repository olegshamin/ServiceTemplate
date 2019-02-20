//
//  PersonNetworkMapper.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol PersonNetworkMapper {
    func map(_ dictionary: ModelDictionary) throws -> Person
    func map(_ asteroid: Person) throws -> ModelDictionary
}

final class PersonNetworkMapperImpl: PersonNetworkMapper, Mapper {
    
    typealias InputModel = ModelDictionary
    typealias OutputModel = Person
    
    // MARK: PersonNetworkMapper
    
    func map(_ asteroid: Person) throws -> ModelDictionary {
        assertionFailure("Not implemented")
        return [:]
    }
    
    func map(_ dictionary: ModelDictionary) throws -> Person {
        
        let id: String = try dictionary.mapField(withKey: ServerField.id)
        let name: String = try dictionary.mapField(withKey: ServerField.name)
        let age: Int = try dictionary.mapField(withKey: ServerField.age)
        let height: Double = try dictionary.mapField(withKey: ServerField.height)
        
        return Person(id: id,
                      name: name,
                      age: age,
                      height: height)
    }
}
