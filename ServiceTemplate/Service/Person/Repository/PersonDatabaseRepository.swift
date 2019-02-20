//
//  PersonDatabaseRepository.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class PersonDatabaseRepository: PersonRepository, DatabaseRepository {
    
    typealias DatabaseModel = RealmPerson
    typealias PrimaryKey = String
    
    // MARK: Private Properties
    
    private let personDatabaseMapper: PersonDatabaseMapper
    
    // MARK: Initialization
    
    init(
        personDatabaseMapper: PersonDatabaseMapper
        ) {
        self.personDatabaseMapper = personDatabaseMapper
    }
    
    // MARK: PersonRepository
    
    func person(with request: PersonRequest, completion: @escaping PersonResultHandler) {
        let result = Result { () -> Person in
            return try personDatabaseMapper.map(fetch(for: request.id))
        }
        completion(result)
    }
    
    func create(_ person: Person, completion: @escaping VoidResultHandler) {
        let result = Result {
            let databaseModel = try personDatabaseMapper.map(person)
            try createOrUpdate(databaseModels: [databaseModel])
        }
        completion(result)
    }
    
    func create(with request: CreatePersonRequest, completion: @escaping VoidResultHandler) {
        assertionFailure("Not implemented")
    }
}
