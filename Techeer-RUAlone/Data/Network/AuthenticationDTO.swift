//
//  DTO.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/16.
//

import Foundation

// MARK: Reqeust DTO
protocol AuthenticationRequestDTO: Encodable {
    var accessToken: String { get set }
}

struct SignUpRequestDTO: AuthenticationRequestDTO {
    var accessToken: String
}

struct SignInRequestDTO: AuthenticationRequestDTO {
    var accessToken: String
}

// MARK: Response DTO
protocol AuthenticationResponseDTO: Decodable {
    var code: Int { get }
    var message: String { get }
    var isSuccessful: Bool { get }
}

struct SignUpResponseDTO: AuthenticationResponseDTO {
    var code: Int
    var message: String
    var isSuccessful: Bool
}

struct SignInResponseDTO: AuthenticationResponseDTO {
    var code: Int
    var message: String
    var isSuccessful: Bool
    var data: AuthenticationToken
}
