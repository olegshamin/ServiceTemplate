//
//  SyncScheduler.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

/// A synchronous implementation of Scheduler for unit testing.
final class SyncScheduler: Scheduler {
    func doInBg(block: @escaping () -> Void) {
        block()
    }
    
    func doOnMainThread(block: @escaping () -> Void) {
        block()
    }
}
