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
        case address
        case startAt = "StartAt"
        case limitMember = "LimitMember"
        case foodCategory = "FoodCategory"
    }

    var title: String = ""
    var address: String = ""
    var startAt: Date = Date()
    var limitMember: Int = 0
    var foodCategory: FoodCategory = .korean
    
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
