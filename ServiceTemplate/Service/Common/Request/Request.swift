//
//  Request.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import Foundation
import Alamofire

/// Used instead of Alamofire's HTTPMethod
/// to avoid 'import Alamofire' statements in every request file.
typealias RequestMethod = HTTPMethod
typealias ParameterEncoding = Alamofire.ParameterEncoding
typealias JSONEncoding = Alamofire.JSONEncoding
typealias URLEncoding = Alamofire.URLEncoding

/// Protocol for implementing url requests.
/// Group requests by entity types.
protocol Request: URLRequestConvertible {
    var path: String { get }
    var method: RequestMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var encoding: ParameterEncoding { get }
}

// MARK: Default values

extension Request {
    
    var parameters: [String: Any] {
        return [:]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}

// MARK: URLRequestConvertible
extension Request {
    func asURLRequest() throws -> URLRequest {
        let apiVerstionService = ServiceFactory.shared.apiVersionService
        let hostService = ServiceFactory.shared.hostService
        let version = "/v\(apiVerstionService.apiVersionNumber())"
        
        let urlString = hostService.host() + version + path
        let url = try urlString.asURL()
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return try encoding.encode(request, with: parameters)
    }
}
