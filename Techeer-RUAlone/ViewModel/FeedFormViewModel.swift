//
//  FeedFormModelView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/10.
//

import Foundation
import SwiftUI

enum FoodCategory: String, CaseIterable, Codable {
    case korean = "Korean"
    case chinese = "Chinese"
    case japanese = "Japanese"
    case chicken = "Chicken"
    case bunsik = "Bunsik"
    case western = "Western"
    var description : String {
        get {
            switch(self) {
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


struct Form: Codable {
    var title: String = ""
    var location: String = ""
    var startAt: Date = Date()
    var numberOfMember: Int = 0
    var foodCategory: FoodCategory = .korean
    
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
