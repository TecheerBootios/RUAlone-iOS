//
//  Endpoint.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/14.
//

import Foundation
import Alamofire

enum AuthenticationEndpoint: URLRequestConvertible {
    case signIn
    case signUp
    
    func asURLRequest() throws -> URLRequest {
        let url = try Base.ProductionServer.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Base.AcceptType.json.rawValue, forHTTPHeaderField: Base.HTTPHeaderField.acceptType.rawValue)
        return request
    }
    
    private var method: HTTPMethod {
        switch self {
        case .signIn, .signUp:
            return .post
        }
    }
    
    private var path: String {
        switch self {
        case .signIn:
            return "/api/social/login/kakao"
        case .signUp:
            return "/api/social/signup/kakao"
        }
    }
}

enum UserEndpoint: URLRequestConvertible {
    case updateUser
    case fetchUserByEmail(String)
    case fetchUserByID(String)
    case deleteUserByID(String)
    case fetchUsers
    
    func asURLRequest() throws -> URLRequest {
        let url = try Base.ProductionServer.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Base.AcceptType.json.rawValue, forHTTPHeaderField: Base.HTTPHeaderField.acceptType.rawValue)
        return request
    }
    
    private var method: HTTPMethod {
        switch self {
        case .updateUser:
            return .put
        case .fetchUserByID, .fetchUserByEmail, .fetchUsers:
            return .get
        case .deleteUserByID:
            return .delete
        }
    }
    
    private var path: String {
        switch self {
        case .updateUser:
            return "/api/user"
        case .fetchUserByEmail(let email):
            return "/api/user/email/\(email)"
        case .fetchUserByID(let id):
            return "/api/user/id/\(id)"
        case .deleteUserByID(let id):
            return "/api/user/\(id)"
        case .fetchUsers:
            return "/api/users"
        }
    }
}
