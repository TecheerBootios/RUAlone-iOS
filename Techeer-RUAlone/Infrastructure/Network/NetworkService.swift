//
//  Service.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/16.
//

import Alamofire
import Foundation

class NetworkService {
    static func signUp(with token: SignUpRequestDTO, completion: @escaping (Result<SignUpResponseDTO, AFError>) -> Void) {
        AF.request(AuthenticationEndpoint.signUp(accessToken: token.accessToken))
            .responseDecodable { (response: DataResponse<SignUpResponseDTO, AFError>) in
                completion(response.result)
            }
    }
    
    static func signIn(with token: SignInRequestDTO, completion: @escaping (Result<SignInResponseDTO, AFError>) -> Void) {
        AF.request(AuthenticationEndpoint.signIn(accessToken: token.accessToken))
            .responseDecodable { (response: DataResponse<SignInResponseDTO, AFError>) in
                completion(response.result)
            }
    }
    
    static func fetchUser(with email: String, completion: @escaping (Result<UserResponseDTO, AFError>) -> Void) {
        AF.request(UserEndpoint.fetchUserByEmail(email))
            .responseDecodable { (response: DataResponse<UserResponseDTO, AFError>) in
                completion(response.result)
            }
    }
    
    static func createPost(with dto: PostCreateRequestDTO, completion: @escaping (Result<PostCreateResponseDTO, AFError>) -> Void) {
        AF.request(PostEndpoint.createPost(dto))
            .responseDecodable { (response: DataResponse<PostCreateResponseDTO, AFError>) in
                completion(response.result)
            }
    }
    
    static func fetchPosts(completion: @escaping (Result<PostsFetchResponseDTO, AFError>) -> Void) {
        AF.request(PostEndpoint.fetchPosts)
            .responseDecodable { (response: DataResponse<PostsFetchResponseDTO, AFError>) in
                completion(response.result)
            }
    }
    
    static func fetchPostsWithDistance(with location: Location, completion: @escaping (Result<PostsFetchResponseDTO, AFError>) -> Void) {
        AF.request(PostEndpoint.fetchPostWithDistance(location.latitude, location.longitude))
            .responseDecodable { (response: DataResponse<PostsFetchResponseDTO, AFError>) in
                completion(response.result)
            }
    }
}
