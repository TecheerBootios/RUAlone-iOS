//
//  Service.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/16.
//

import Alamofire
import Foundation

class NetworkService {
    static func signUp(with token: SignUpRequestDTO, completion: @escaping (Result<[SignUpResponseDTO], AFError>) -> Void) {
        AF.request(AuthenticationEndpoint.signUp)
            .responseDecodable { (response: DataResponse<[SignUpResponseDTO], AFError>) in
                completion(response.result)
            }
    }
    
    static func signIn(with token: SignInRequestDTO, completion: @escaping (Result<[SignInResponseDTO], AFError>) -> Void) {
        AF.request(AuthenticationEndpoint.signIn)
            .responseDecodable { (response: DataResponse<[SignInResponseDTO], AFError>) in
                completion(response.result)
            }
    }
    
}
