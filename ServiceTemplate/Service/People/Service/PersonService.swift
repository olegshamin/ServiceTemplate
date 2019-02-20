//
//  PersonService.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

typealias PersonResult = Result<Person>
typealias PersonResultHandler = (PersonResult) -> Void

protocol PersonService: Service {
    func person(with request: PersonRequest,
                completion: @escaping PersonResultHandler)
    func create(_ person: Person,
                completion: @escaping VoidResultHandler)
}
