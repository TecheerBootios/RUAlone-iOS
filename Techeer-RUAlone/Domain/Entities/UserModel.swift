//
//  UserModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/23.
//

import Foundation

struct UserEntity: Codable, Equatable {
    let name: String
    let email: String
    let nickname: String
}
