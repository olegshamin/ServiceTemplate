//
//  ServiceAssembly+Bundle.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

extension ServiceAssembly {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func jsonData(fromFileWithName fileName: String) -> Data {
        return Data.jsonData(fromFileWithName: fileName, in: bundle)
    }
}
