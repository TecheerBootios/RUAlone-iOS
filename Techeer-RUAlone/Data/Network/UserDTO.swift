//
//  UserDTO.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/21.
//

import Foundation

struct UserRequestDTO: DefaultRequestDTO {
    var accessToken: String
    var email: String
}

struct UserResponseDTO: DefaultResponseDTO {
    var code: Int
    var msg: String
    var success: Bool
    var data: UserData
}

struct UserData: Decodable {
    let authorities: [Authority]
    let userId: Int
    let email: String
    let name: String
    let nickName: String
    let roles: [String]
    let modifiedDate: String
}
        
struct Authority: Decodable {
    let authority: String
}
