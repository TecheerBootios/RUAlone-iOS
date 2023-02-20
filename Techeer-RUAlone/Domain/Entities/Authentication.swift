//
//  CommonDTO.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/16.
//

import Foundation

struct AuthenticationToken: Equatable, Decodable {
    let accessToken: String
    let accessTokenExpireTimeStamp: Int
    let grantType: String
    let refreshToken: String
}
