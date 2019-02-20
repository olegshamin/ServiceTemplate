//
//  PeopleRequest.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

struct PersonRequest: Request {
    
    // MARK: Properties
    
    let id: String
    
    // MARK: Initialization
    
    init(
        id: String
        ) {
        self.id = id
    }
    
    // MARK: Request
    
    var path: String {
        return URLString.person
    }
    
    var parameters: [String: Any] {
        return [
            ServerField.id: id
        ]
    }
}
