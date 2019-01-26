//
//  KeychainService.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation
import KeychainAccess

protocol KeychainService {
    func string(for key: StoreKey<String>, userId: String?) -> String?
    func set(string: String, for key: StoreKey<String>, userId: String?)
    func bool(for key: StoreKey<String>, userId: String?) -> Bool?
    func set(bool: Bool, for key: StoreKey<String>, userId: String?)
    func delete(for key: StoreKey<String>, userId: String?)
}

final class KeychainServiceImpl: KeychainService {
    
    func string(for key: StoreKey<String>, userId: String?) -> String? {
        let keychain = KeychainAccess.Keychain(service: service(for: userId))
        return keychain[key.rawValue]
    }
    
    func set(string: String, for key: StoreKey<String>, userId: String?) {
        let keychain = KeychainAccess.Keychain(service: service(for: userId))
        keychain[key.rawValue] = string
    }
    
    func bool(for key: StoreKey<String>, userId: String?) -> Bool? {
        let keychain = KeychainAccess.Keychain(service: service(for: userId))
        let string = keychain[key.rawValue]
        switch string {
        case .some("\(true)"): return true
        case .some("\(false)"): return false
        case .none:  return nil
        default:
            assertionFailure("Invalid switch case")
            return nil
        }
    }
    
    func set(bool: Bool, for key: StoreKey<String>, userId: String?) {
        let keychain = KeychainAccess.Keychain(service: service(for: userId))
        let string = "\(bool)"
        keychain[key.rawValue] = string
    }
    
    func delete(for key: StoreKey<String>, userId: String?) {
        let keychain = KeychainAccess.Keychain(service: service(for: userId))
        keychain[key.rawValue] = nil
    }
    
    // MARK: Private Helpers
    
    private func service(for userId: String?) -> String {
        if let userId = userId {
            return "\(Keychain.service).\(userId)"
        } else {
            return "\(Keychain.service)"
        }
    }
}
