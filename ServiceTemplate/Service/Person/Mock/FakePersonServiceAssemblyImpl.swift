//
//  FakePersonServiceAssemblyImpl.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

final class FakePersonServiceAssemblyImpl: PersonServiceAssemblyImpl {
    
    // MARK: - ServiceAssembly
    
    override func transport() -> Transport {
        let data = jsonData(fromFileWithName: "personModel")
        return FakeDataTransport(data: data)
    }
    
    override func scheduler() -> Scheduler {
        return SyncScheduler()
    }
}
