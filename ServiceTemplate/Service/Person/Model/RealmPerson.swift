//
//  RealmPerson.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmPerson: Object {
    
    // MARK: Properties
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = -1
    @objc dynamic var height: Double = -1
    
    override static func primaryKey() -> String? {
        return #keyPath(RealmPerson.id)
    }
    
    // MARK: Initialization
    
    convenience init(
        id: String,
        name: String,
        age: Int,
        height: Double
        ) {
        self.init()
        self.id = id
        self.name = name
        self.age = age
        self.height = height
    }
    
    // MARK: Equatable
    
    static func == (lhs: RealmPerson, rhs: RealmPerson) -> Bool {
        return lhs.id == rhs.id
    }
}
