//
//  BaseTestCase.swift
//  ServiceTemplateTests
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import XCTest
import RealmSwift

class BaseTestCase: XCTestCase {
    
    // MARK: Life cycle
    
    override func setUp() {
        super.setUp()
        clearDatabase()
        clearKeychain()
        clearUserDefaults()
    }
    
    override func tearDown() {
        super.tearDown()
        clearDatabase()
        clearKeychain()
        clearUserDefaults()
    }
    
    // MARK: Private helpers
    
    private func clearDatabase() {
        guard let realm = try? Realm() else {
            return
        }
        try? realm.write {
            realm.deleteAll()
        }
    }
    
    private func clearKeychain() {
        let secClasses = [
            kSecClassGenericPassword as String,
            kSecClassInternetPassword as String,
            kSecClassCertificate as String,
            kSecClassKey as String,
            kSecClassIdentity as String
        ]
        for secClass in secClasses {
            let query = [kSecClass as String: secClass]
            SecItemDelete(query as CFDictionary)
        }
    }
    
    private func clearUserDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
}
