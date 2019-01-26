//
//  GCDScheduler.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

/// Implementation of Scheduler protocol using Grand Central Dispatch.
final class GCDScheduler: Scheduler {

    // MARK: Scheduler

    func doOnMainThread(block: @escaping () -> Void) {
        DispatchQueue.main.async(execute: block)
    }

    func doInBg(block: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
}
