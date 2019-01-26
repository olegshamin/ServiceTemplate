//
//  RepositoryError.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

enum RepositoryError: Error, LocalizedError {
    case noObjectWithPrimaryKey(Any, ofType: Any.Type)
    
    var errorDescription: String? {
        switch self {
        case .noObjectWithPrimaryKey(let primaryKey, let type):
            let formatString = "No object in database for primary key '%@' of type '%@'"
            return .localizedStringWithFormat(formatString, "\(primaryKey)", "\(type)")
        }
    }
}
