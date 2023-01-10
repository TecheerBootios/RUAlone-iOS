//
//  FeedFormModelView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/10.
//

import Foundation

enum FoodCategory: String, CaseIterable, Codable {
    case 한식 = "Korean"
    case 중식 = "Chinese"
    case 일식 = "Japanese"
    case 치킨 = "Chicken"
    case 분식 = "Bunsik"
    case 양식 = "Western"
}

struct Form: Codable {
    var title: String = ""
    var location: String = ""
    var startAt: Date = Date()
    var numberOfMember: Int = 0
    var foodCategory: FoodCategory = .한식
    
    enum CodingKeys: String, CodingKey {
        case title
        case location
        case startAt = "startAt"
        case numberOfMember = "limitMember"
        case foodCategory = "foodCategory"
    }
}

final class FeedFormViewModel: ObservableObject {
    @Published var form: Form = Form()
    
    func setLocation(at location: String) {
        self.form.location = location
    }
}
