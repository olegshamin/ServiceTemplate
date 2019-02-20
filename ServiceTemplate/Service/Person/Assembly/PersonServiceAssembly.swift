//
//  PersonServiceAssembly.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol PersonServiceAssembly {
    func service() -> PersonService
}

class PersonServiceAssemblyImpl: ServiceAssembly, PersonServiceAssembly {
    
    // MARK: PersonServiceAssembly
    
    func service() -> PersonService {
        return PersonServiceImpl(scheduler: scheduler(),
                                 networkRepository: networkRepository(),
                                 databaseRepository: databaseRepository(),
                                 serializer: serializer())
    }
    
    // MARK: Repositories
    
    private func networkRepository() -> PersonRepository {
        return PersonNetworkRepository(transport: transport(),
                                       deserializer: deserializer(),
                                       networkMapper: networkMapper(),
                                       requestErrorNetworkMapper: requestErrorNetworkMapper())
    }
    
    private func databaseRepository() -> PersonRepository {
        return PersonDatabaseRepository(personDatabaseMapper: databasekMapper())
    }
    
    // MARK: Mapper
    
    private func networkMapper() -> PersonNetworkMapper {
        return PersonNetworkMapperImpl()
    }
    
    private func databasekMapper() -> PersonDatabaseMapper {
        return PersonDatabaseMapperImpl()
    }
}
