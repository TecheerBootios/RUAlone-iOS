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
}

struct FoodStat: Identifiable, Hashable {
    var id = UUID()
    let category: FormModel.FoodCategory
    let restraunt: String
    let minutes: Int
    let money: Int
    let date: Date
}

struct SpendingStat: Identifiable, Hashable {
    var id = UUID()
    let values: [Double]
    let category: [String]
    let colors: [Color]
}
