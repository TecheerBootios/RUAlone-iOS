//
//  ActivityStatModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/13.
//

import Foundation

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
