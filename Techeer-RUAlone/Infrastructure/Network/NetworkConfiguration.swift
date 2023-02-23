//
//  NetworkConfig.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/14.
//

import Foundation

struct Base {
    struct ProductionServer {
        static let baseURL = "http://localhost:8080"
    }
    
    enum HTTPHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
    
    enum AcceptType: String {
        case json = "application/json"
    }
    
    enum RequestHeaderField: String {
        case all = "*/*"
    }
}

