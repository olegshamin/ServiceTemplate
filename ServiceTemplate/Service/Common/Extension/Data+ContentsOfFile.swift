//
//  Data+ContentsOfFile.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

extension Data {
    static func jsonData(fromFileWithName fileName: String, in bundle: Bundle) -> Data {
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError("Invalid file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Invalid data")
        }
        return data
    }
}
