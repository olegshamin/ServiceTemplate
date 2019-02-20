//
//  OfflinePersonServiceAssemblyImpl.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class OfflinePersonServiceAssemblyImpl: PersonServiceAssemblyImpl {
    
    // MARK: - ServiceAssembly
    
    override func transport() -> Transport {
        return OfflineTransport()
    }
    
    override func scheduler() -> Scheduler {
        return SyncScheduler()
    }
}
