//
//  APIVersionServiceAssembly.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol APIVersionServiceAssembly {
    func service() -> APIVersionService
}

final class APIVersionServiceAssemblyImpl: ServiceAssembly, APIVersionServiceAssembly {
    
    // MARK: Private properties
    
    private let localStoreServiceAssembly: LocalStoreServiceAssembly
    
    // MARK: Initialization
    
    init(
        localStoreServiceAssembly: LocalStoreServiceAssembly
        ) {
        self.localStoreServiceAssembly = localStoreServiceAssembly
    }
    
    // MARK: APIVersionServiceAssembly
    
    func service() -> APIVersionService {
        return APIVersionServiceImpl(localStoreService: localStoreServiceAssembly.service())
    }
}
