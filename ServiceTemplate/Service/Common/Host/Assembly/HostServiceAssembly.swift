//
//  HostServiceAssembly.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol HostServiceAssembly {
    func service() -> HostService
}

final class HostServiceAssemblyImpl: ServiceAssembly, HostServiceAssembly {
    
    // MARK: Private properties
    
    private let localStoreServiceAssembly: LocalStoreServiceAssembly
    
    // MARK: Initialization
    
    init(
        localStoreServiceAssembly: LocalStoreServiceAssembly
        ) {
        self.localStoreServiceAssembly = localStoreServiceAssembly
    }
    
    // MARK: HostServiceAssembly
    
    func service() -> HostService {
        return HostServiceImpl(localStoreService: localStoreServiceAssembly.service())
    }
}
