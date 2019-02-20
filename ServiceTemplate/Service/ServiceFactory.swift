//
//  ServiceFactory.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class ServiceFactory {
    
    // MARK: Public properties
    
    static let shared = ServiceFactory()
    
    // Services
    let localStoreService: LocalStoreService
    let hostService: HostService
    let apiVersionService: APIVersionService
    let personService: PersonService
    
    // MARK: Initialization
    
    private init() {
        
        // Assembly
        
        let localStoreServiceAssembly = LocalStoreServiceAssemblyImpl()
        let hostServiceAssembly = HostServiceAssemblyImpl(localStoreServiceAssembly: localStoreServiceAssembly)
        let apiVersionServiceAssembly = APIVersionServiceAssemblyImpl(
            localStoreServiceAssembly: localStoreServiceAssembly
        )
        
        // Service
        
        self.localStoreService = localStoreServiceAssembly.service()
        self.hostService = hostServiceAssembly.service()
        self.apiVersionService = apiVersionServiceAssembly.service()
        self.personService = PersonServiceAssemblyImpl().service()
    }
}
