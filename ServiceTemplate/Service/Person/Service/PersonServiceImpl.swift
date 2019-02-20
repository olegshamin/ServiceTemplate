//
//  PersonServiceImpl.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class PersonServiceImpl: PersonService {
    
    // MARK: Private properties
    
    private let scheduler: Scheduler
    private let networkRepository: PersonRepository
    private let databaseRepository: PersonRepository
    private let serializer: Serializer
    
    // MARK: Initialization
    
    init(
        scheduler: Scheduler,
        networkRepository: PersonRepository,
        databaseRepository: PersonRepository,
        serializer: Serializer
        ) {
        self.scheduler = scheduler
        self.networkRepository = networkRepository
        self.databaseRepository = databaseRepository
        self.serializer = serializer
    }
    
    // MARK: AsteroidService
    
    func person(with id: String, completion: @escaping PersonResultHandler) {
        
        let request = PersonRequest(id: id)
        scheduler.doInBg { [weak self] in
            self?.networkRepository.person(with: request, completion: { result in
                self?.handle(personNetworkResult: result, request: request, completion: completion)
            })
        }
    }
    
    func create(_ person: Person, completion: @escaping VoidResultHandler) {
        guard let personData = try? serializer.serialize(person) else {
            completion(.failure(SerializerError.cantSerializeObject(withType: Person.self)))
            return
        }
        
        let request = CreatePersonRequest(personData: personData)
        scheduler.doInBg { [weak self] in
            guard let self = self else {
                return
            }
            self.databaseRepository.create(person, completion: { _ in })
            
            self.networkRepository.create(with: request, completion: { result in
                self.handle(result: result, scheduler: self.scheduler, completion: completion)
            })
        }
    }
    
    // MARK: Private handlers
    
    private func handle(
        personNetworkResult result: PersonResult,
        request: PersonRequest,
        completion: @escaping PersonResultHandler
        ) {
        switch result {
        case .success(let person):

            databaseRepository.create(person) { _ in }
            handle(result: result, scheduler: scheduler, completion: completion)

        case .failure(let error):
            databaseRepository.person(with: request, completion: { [weak self] result in
                self?.handle(personDatabaseResult: result, networkError: error, completion: completion)
            })
        }
    }

    private func handle(
        personDatabaseResult result: PersonResult,
        networkError: Error,
        completion: @escaping PersonResultHandler
        ) {
        guard case .success = result else {
            handle(error: networkError, scheduler: scheduler, completion: completion)
            return
        }
        handle(result: result, scheduler: scheduler, completion: completion)
    }
}
