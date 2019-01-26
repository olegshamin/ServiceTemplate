//
//  RequestErrorNetworkMapper.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 26/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

protocol RequestErrorNetworkMapper {
    func map(_ dictionary: ModelDictionary) throws -> RequestError
    func map(_ requestError: RequestError) throws -> ModelDictionary
}

final class RequestErrorNetworkMapperImpl: RequestErrorNetworkMapper, Mapper {
    typealias InputModel = RequestError
    typealias OutputModel = ModelDictionary
    
    func map(_ dictionary: ModelDictionary) throws -> RequestError {
        let errorDictionary: ModelDictionary = try dictionary.mapField(withKey: "error")
        let message: String = try errorDictionary.mapField(withKey: "message")
        let code: String = try errorDictionary.mapField(withKey: "code")
        return RequestError(message: message, code: code)
    }
    
    func map(_ requestError: RequestError) -> ModelDictionary {
        return [:]
    }
}
