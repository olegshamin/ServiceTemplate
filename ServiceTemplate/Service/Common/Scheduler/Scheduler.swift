//
//  Scheduler.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

/// Protocol for scheduling tasks in background and on main thread
/// If a service (or other entity) needs to perform work in background or on main thread
/// an entity implementing this protocol should be injected into it and used
protocol Scheduler: class {
    func doOnMainThread(block: @escaping () -> Void)
    func doInBg(block: @escaping () -> Void)
}
