//
//  StoreKey.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

struct StoreKey<Value>: RawRepresentable {
    typealias RawValue = String
    
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension StoreKey {
    
    // Base
    static var apiVersion: StoreKey<Int> { return StoreKey<Int>(rawValue: "apiVersion") }
    static var host: StoreKey<String> { return StoreKey<String>(rawValue: "host") }
}
