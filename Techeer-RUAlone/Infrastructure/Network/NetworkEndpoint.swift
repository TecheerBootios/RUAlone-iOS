//
//  Endpoint.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/14.
//

import Foundation
import Alamofire

enum AuthenticationEndpoint: URLRequestConvertible {
    case signIn(accessToken: String)
    case signUp(accessToken: String)
    
    func asURLRequest() throws -> URLRequest {
        let url = try Base.ProductionServer.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Base.AcceptType.json.rawValue, forHTTPHeaderField: Base.HTTPHeaderField.acceptType.rawValue)
        if let parameters = parameters {
            return try encoding.encode(request, with: parameters)
        }
            
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
    
    private var parameters: Parameters? {
        switch self {
        case .signIn(let accessToken):
            return ["accessToken": accessToken]
        case .signUp(let accessToken):
            return ["accessToken": accessToken]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .signIn:
            return JSONEncoding.default
        case .signUp:
            return JSONEncoding.default
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
        if let token = KeyChainService.shared.readToken() {
            let headers: HTTPHeaders = [
                "X-AUTH-TOKEN": token
            ]
            request.headers = headers
        }
        if let parameters = parameters {
            return try encoding.encode(request, with: parameters)
        }
        
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
    
    private var parameters: Parameters? {
        switch self {
        case .fetchUserByEmail, .fetchUserByID:
            return ["lang": "ko"]
        default:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchUserByID, .fetchUserByEmail:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}

enum PostEndpoint: URLRequestConvertible {
    case createPost
    case updatePost
    case fetchPostAll
    case fetchPost
    case deletePostByID(String)
    case fetchPostByID(String)
    
    func asURLRequest() throws -> URLRequest {
        let url = try Base.ProductionServer.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Base.AcceptType.json.rawValue, forHTTPHeaderField: Base.HTTPHeaderField.acceptType.rawValue)
        return request
    }
    
    private var method: HTTPMethod {
        switch self {
        case .createPost:
            return .post
        case .updatePost:
            return .put
        case .fetchPost, .fetchPostAll, .fetchPostByID:
            return .get
        case .deletePostByID:
            return .delete
        }
    }
    
    private var path: String {
        switch self {
        case .createPost:
            return "/api/post"
        case .updatePost:
            return "/api/post"
        case .fetchPost:
            return "/api/post/list"
        case .fetchPostAll:
            return "/api/post/search"
        case .fetchPostByID(let id):
            return "/api/post/\(id)"
        case .deletePostByID(let id):
            return "/api/post/\(id)"
        }
    }
}
