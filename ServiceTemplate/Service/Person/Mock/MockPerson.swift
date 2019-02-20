//
//  MockPerson.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

extension Person {
    
    static var mockPerson: Person {
        return Person(id: "ad990087-f798-4056-b62c-cdf629d2da6b",
                      name: "Alex",
                      age: 21,
                      height: 182.5)
    }
}
