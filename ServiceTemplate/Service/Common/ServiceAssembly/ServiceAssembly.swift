//
//  ServiceAssembly.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation

/// Base class for service assemblies.
/// Service assembly is an object which is responsible for instansiating service objects.
class ServiceAssembly {
    
    // MARK: User Defaults
    
    func userDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    // MARK: Service Components
    
    func scheduler() -> Scheduler {
        return GCDScheduler()
    }
    
    // MARK: Network Repository Components
    
    func transport() -> Transport {
        return AlamofireTransport()
    }
    
    func deserializer() -> Deserializer {
        return JSONDeserializer()
    }
    
    func serializer() -> Serializer {
        return JSONSerializer()
    }
    
    // MARK: Network Repository Error Mappers
    
    func requestErrorNetworkMapper() -> RequestErrorNetworkMapper {
        return RequestErrorNetworkMapperImpl()
    }
}
