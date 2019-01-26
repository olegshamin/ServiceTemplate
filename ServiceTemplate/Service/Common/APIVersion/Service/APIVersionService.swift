//
//  APIVersionService.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol APIVersionService {
    func setApiVersionNumber(_ apiVersionNumber: Int)
    func apiVersionNumber() -> Int
}

final class APIVersionServiceImpl: APIVersionService {
    
    // MARK: Private properties
    
    private let localStoreService: LocalStoreService
    
    // MARK: Initialization
    
    init(
        localStoreService: LocalStoreService
        ) {
        self.localStoreService = localStoreService
    }
    
    // MARK: APIVersionService
    
    func setApiVersionNumber(_ apiVersionNumber: Int) {
        localStoreService.set(value: apiVersionNumber, for: .apiVersion)
    }
    
    func apiVersionNumber() -> Int {
        guard let version = localStoreService.value(for: .apiVersion) else {
            return 1
        }
        return version
    }
}
