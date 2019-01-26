//
//  DatabaseRepository.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation
import RealmSwift

/// Base protocol for database repositories.
protocol DatabaseRepository {
    associatedtype DatabaseModel
    associatedtype PrimaryKey
    
    func fetch(for primaryKey: PrimaryKey) throws -> DatabaseModel
    func fetchAll() throws -> [DatabaseModel]
    func createOrUpdate(databaseModels: [DatabaseModel]) throws
    func delete(with primaryKey: PrimaryKey) throws
    func delete(databaseModels: [DatabaseModel]) throws
}

extension DatabaseRepository where DatabaseModel: Object {
    
    // MARK: Creating and updating
    
    func createOrUpdate(databaseModels: [DatabaseModel]) throws {
        let realm = try Realm()
        try realm.write {
            realm.add(databaseModels, update: true)
        }
    }
    
    // MARK: Deleting
    
    func delete(with primaryKey: PrimaryKey) throws {
        let databaseModel = try fetch(for: primaryKey)
        let realm = try Realm()
        try realm.write {
            realm.delete(databaseModel)
        }
    }
    
    func delete(databaseModels: [DatabaseModel]) throws {
        let realm = try Realm()
        try realm.write {
            realm.delete(databaseModels)
        }
    }
    
    func deleteAll() throws {
        let realm = try Realm()
        try realm.write {
            realm.delete(realm.objects(DatabaseModel.self))
        }
    }
    
    // MARK: Fetching
    
    func fetchAll() throws -> [DatabaseModel] {
        let realm = try Realm()
        return Array(realm.objects(DatabaseModel.self))
    }
    
    func fetch(filter: NSPredicate) throws -> [DatabaseModel] {
        let realm = try Realm()
        return realm.objects(DatabaseModel.self).filter(filter).map({ $0 })
    }
    
    func fetch(for primaryKey: PrimaryKey) throws -> DatabaseModel {
        let realm = try Realm()
        guard let model = realm.object(ofType: DatabaseModel.self, forPrimaryKey: primaryKey) else {
            throw RepositoryError.noObjectWithPrimaryKey(primaryKey, ofType: DatabaseModel.self)
        }
        return model
    }
}
