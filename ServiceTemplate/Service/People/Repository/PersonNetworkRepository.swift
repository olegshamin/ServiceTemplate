//
//  PersonNetworkRepository.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class PersonNetworkRepository: PersonRepository, NetworkRepository {
    
    // MARK: NetworkRepository
    
    let transport: Transport
    let deserializer: Deserializer
    let requestErrorNetworkMapper: RequestErrorNetworkMapper
    private let networkMapper: PersonNetworkMapper
    
    // MARK: Initialization
    
    init(
        transport: Transport,
        deserializer: Deserializer,
        networkMapper: PersonNetworkMapper,
        requestErrorNetworkMapper: RequestErrorNetworkMapper
        ) {
        self.transport = transport
        self.deserializer = deserializer
        self.networkMapper = networkMapper
        self.requestErrorNetworkMapper = requestErrorNetworkMapper
    }
    
    // MARK: PersonRepository
    
    func person(with request: PersonRequest, completion: @escaping PersonResultHandler) {
        transport.perform(request: request) { [weak self] result in
            self?.handle(personResult: result, completion: completion)
        }
    }
    
    func create(with request: CreatePersonRequest, completion: @escaping VoidResultHandler) {
        transport.perform(request: request) { [weak self] result in
            self?.handle(voidTransportResult: result, completion: completion)
        }
    }
    
    func create(_ person: Person, completion: @escaping VoidResultHandler) {
        assertionFailure("Not implemented")
    }
    
    // MARK: Private helpers
    
    private func handle(
        personResult result: TransportResponseResult,
        completion: @escaping PersonResultHandler
        ) {
        handle(transportResponseResult: result, completion: completion) { data in
            let result = Result(attempt: { try parsePerson(data: data) })
            handle(result: result, completion: completion)
        }
    }
    
    // MARK: Parsing helpers
    
    private func parsePerson(
        data: Data
        ) throws -> Person {
        
        let responseDictionary = try deserializer.deserialize(data: data)
        let person = try networkMapper.map(responseDictionary)
        
        return person
    }
}
