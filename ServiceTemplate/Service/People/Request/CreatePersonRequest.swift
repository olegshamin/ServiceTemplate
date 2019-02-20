//
//  CreatePersonRequest.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

struct CreatePersonRequest: Request {
    
    // MARK: Properties
    
    let personData: Data
    
    // MARK: Initialization
    
    init(
        personData: Data
        ) {
        self.personData = personData
    }
    
    // MARK: Request
    
    var path: String {
        return URLString.createPerson
    }
    
    var method: RequestMethod {
        return .post
    }
    
    var body: Data? {
        return personData
    }
}
