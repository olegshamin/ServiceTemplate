//
//  RequestError.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

struct RequestError: Error, LocalizedError {
    
    // MARK: Properties
    
    var message: String
    var code: String
    
    // MARK: Initializers
    
    public init(error: NSError) {
        message = error.description
        code = "\(error.code)"
    }
    
    public init(
        message: String,
        code: String
        ) {
        self.message = message
        self.code = code
    }
    
    // MARK: LocalizedError
    
    public var errorDescription: String? {
        return message
    }
}
