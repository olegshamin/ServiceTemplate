//
//  LocalStoreServiceAssembly.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol LocalStoreServiceAssembly {
    func service() -> LocalStoreService
}

final class LocalStoreServiceAssemblyImpl: ServiceAssembly, LocalStoreServiceAssembly {
    
    // MARK: LocalStoreServiceAssembly
    
    func service() -> LocalStoreService {
        return LocalStoreServiceImpl(userDefaults: userDefaults())
    }
}
