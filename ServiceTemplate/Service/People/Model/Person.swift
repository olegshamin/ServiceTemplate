//
//  Person.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

struct Person {
    
    // MARK: Properties
    
    let id: String
    let name: String
    let age: Int
    let height: Double
    
    // MARK: Initialization
    
    init(
        id: String,
        name: String,
        age: Int,
        height: Double
        ) {
        self.id = id
        self.name = name
        self.age = age
        self.height = height
    }
}

// MARK: Equatable

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: Encodable

extension Person: Encodable {
    
    enum EncodeKeys: String, CodingKey {
        case id, name, age, height
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodeKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(height, forKey: .height)
    }
}
