//
//  Serializer.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol Serializer {
    func serialize<T: Encodable>(_ encodable: T) throws -> Data
}
