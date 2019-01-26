//
//  HostService.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol HostService {
    func host() -> String
    func setHost(_ host: String)
}

final class HostServiceImpl: HostService {
    
    // MARK: Private properties
    
    private let localStoreService: LocalStoreService
    
    // MARK: Initialization
    
    init(
        localStoreService: LocalStoreService
        ) {
        self.localStoreService = localStoreService
    }
    
    // MARK: HostService
    
    func host() -> String {
        guard let host = localStoreService.value(for: .host) else {
            return URLString.host
        }
        return host
    }
    
    func setHost(_ host: String) {
        localStoreService.set(value: host, for: .host)
    }
}
