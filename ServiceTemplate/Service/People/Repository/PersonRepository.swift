//
//  PersonRepository.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol PersonRepository {
    func person(with request: PersonRequest,
                completion: @escaping PersonResultHandler)
    func create(with request: CreatePersonRequest,
                completion: @escaping VoidResultHandler)
    func create(_ person: Person,
                completion: @escaping VoidResultHandler)
}
