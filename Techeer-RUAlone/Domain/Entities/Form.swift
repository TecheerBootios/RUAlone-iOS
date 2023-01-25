//
//  Form.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/22.
//

import Foundation

struct Form: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case foodCategory = "FoodCategory"
        case address
        case startAt = "StartAt"
        case limitMember = "LimitMember"
        case postType = "PostType"
        case chatURL = "ChatURL"
    }

    var title: String = ""
    var foodCategory: FoodCategory = .korean
    var postType: PostType = .eatOut
    var address: String = ""
    var startAt: Date = Date()
    var limitMember: Int = 1
    var chatURL: String = ""
    
    enum PostType: String, Codable, CaseIterable {
        case eatOut = "EatOut"
        case eatIn = "EatIn"
        var description: String {
            switch self {
            case .eatOut:
                return NSLocalizedString("EatOut", comment: "")
            case .eatIn:
                return NSLocalizedString("EatIn", comment: "")
            }
        }
    }
    
    enum FoodCategory: String, CaseIterable, Codable {
        case korean = "Korean"
        case chinese = "Chinese"
        case japanese = "Japanese"
        case chicken = "Chicken"
        case bunsik = "Bunsik"
        case western = "Western"
        var description: String {
            switch self {
            case .korean:
                return NSLocalizedString("Korean", comment: "")
            case .chinese:
                return NSLocalizedString("Chinese", comment: "")
            case .japanese:
                return NSLocalizedString("Japanese", comment: "")
            case .western:
                return NSLocalizedString("Western", comment: "")
            case .chicken:
                return NSLocalizedString("Chicken", comment: "")
            case .bunsik:
                return NSLocalizedString("Bunsik", comment: "")
            }
        }
    }
}
