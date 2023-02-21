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
    var msg: String { get }
    var success: Bool { get }
}

struct SignUpResponseDTO: AuthenticationResponseDTO {
    var code: Int
    var msg: String
    var success: Bool
}

struct SignInResponseDTO: AuthenticationResponseDTO {
    var code: Int
    var msg: String
    var success: Bool
    var data: Token
}

struct Token: Decodable {
    let accessToken: String
    let accessTokenExpireDate: Int
    let grantType: String
    let refreshToken: String
}
