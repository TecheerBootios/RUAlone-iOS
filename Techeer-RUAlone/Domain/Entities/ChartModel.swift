//
//  ActivityStatModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/13.
//

import Foundation
import SwiftUI

struct ActivityStat: Identifiable, Hashable {
    var id = UUID()
    var month: String
    var count: Int
    var base: Int = 0
    var animate: Bool = false
}

struct FoodStat: Identifiable, Hashable {
    var id = UUID()
    var category: FormModel.FoodCategory
    var restraunt: String
    var minutes: Int
    var money: Int
    var date: Date
    var animate: Bool = false
}

struct SpendingStat: Identifiable, Hashable {
    var id = UUID()
    var values: [Double]
    var category: [String]
    var colors: [Color]
    var animate: Bool = false
}
