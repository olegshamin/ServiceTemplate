//
//  PersonDatabaseMapper.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol PersonDatabaseMapper {
    func map(_ databaseModel: RealmPerson) throws -> Person
    func map(_ uiModel: Person) throws -> RealmPerson
}

final class PersonDatabaseMapperImpl: PersonDatabaseMapper, Mapper {
    
    typealias InputModel = Person
    typealias OutputModel = RealmPerson
    
    // MARK: PersonDatabaseMapper
    
    func map(_ databaseModel: RealmPerson) throws -> Person {
        
        let id = databaseModel.id
        let name = databaseModel.name
        let age = databaseModel.age
        let height = databaseModel.height
        
        return Person(id: id,
                      name: name,
                      age: age,
                      height: height)
    }
    
    func map(_ uiModel: Person) throws -> RealmPerson {
        
        let id = uiModel.id
        let name = uiModel.name
        let age = uiModel.age
        let height = uiModel.height
        
        return RealmPerson(id: id,
                           name: name,
                           age: age,
                           height: height)
    }
}
