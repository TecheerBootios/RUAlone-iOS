//
//  PostDTO.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/23.
//

import Foundation

struct PostCreateRequestDTO: Encodable {
    var chatURL: String
    var creatorEmail: String
    var foodCategory: String
    var limitMember: Int
    var location: Location
    var place: String
    var postType: String
    var startAt: String
    var title: String
}

struct Location: Encodable {
    let latitude: Double
    let longitude: Double
}
