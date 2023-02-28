//
//  Form.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/22.
//

import Foundation

struct FormModel: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case foodCategory = "FoodCategory"
        case address
        case startAt = "StartAt"
        case limitMember = "LimitMember"
        case postType = "PostType"
        case chatURL = "ChatURL"
        case location
    }

    var title: String
    var foodCategory: FoodCategory
    var postType: PostType
    var address: String
    var startAt: Date
    var limitMember: Int
    var chatURL: String
    var location: Location?
    
    init(title: String = "",
         foodCategory: FoodCategory = .korean,
         postType: PostType = .eatOut,
         address: String = "",
         startAt: Date = Date(),
         limitMember: Int = 1,
         chatURL: String = "",
         location: Location? = nil) {
        self.title = title
        self.foodCategory = foodCategory
        self.postType = postType
        self.address = address
        self.startAt = startAt
        self.limitMember = limitMember
        self.chatURL = chatURL
        self.location = location
    }
    
    init(data: PostData) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let startAt = dateFormatter.date(from: data.startAt)
        self.startAt = startAt!
        
        self.title = data.title
        self.foodCategory = FoodCategory(rawValue: data.foodCategory)!
        self.postType = PostType(rawValue: data.postType)!
        self.address = data.place
        self.limitMember = data.limitMember
        self.chatURL = data.chatUrl
        self.location = data.locationInfo
    }
    
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
