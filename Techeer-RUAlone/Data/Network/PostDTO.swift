//
//  PostDTO.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/23.
//

import Foundation

struct PostCreateRequestDTO: Encodable {
    var chatURL: String?
    var creatorEmail: String?
    var foodCategory: String?
    var limitMember: Int?
    var location: Location?
    var place: String?
    var postType: String?
    var startAt: String?
    var title: String?
    init() {}
}

struct PostCreateResponseDTO: Decodable {
    var code: Int
    var msg: String
    var success: Bool
    var data: PostData
}

struct PostsFetchResponseDTO: Decodable {
    var code: Int
    var msg: String
    var success: Bool
    var list: [PostData]
}

struct PostData: Decodable {
    var title: String
    var chatUrl: String
    var creatorName: String
    var startAt: String
    var limitMember: Int
    var place: String
    var foodCategory: String
    var postType: String
    var locationInfo: Location
}

struct Location: Codable {
    let latitude: Double
    let longitude: Double
}
