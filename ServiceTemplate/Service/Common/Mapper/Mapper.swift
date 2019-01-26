//
//  Mapper.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

/// Protocol for mapping entities
protocol Mapper {
    associatedtype InputModel
    associatedtype OutputModel
    
    func map(_ inputModel: InputModel) throws -> OutputModel
    func map(_ outputModel: OutputModel) throws -> InputModel
}
