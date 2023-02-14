//
//  ActivityStat.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/13.
//

import Foundation

extension ActivityStat {
    static func stub() -> [Self] {
        return [.init(month: "Jan", count: 10),
                .init(month: "Feb", count: 5),
                .init(month: "Mar", count: 2),
                .init(month: "Apr", count: 1),
                .init(month: "May", count: 5),
                .init(month: "Jun", count: 8),
                .init(month: "Jul", count: 3),
                .init(month: "Aug", count: 2),
                .init(month: "Sep", count: 6),
                .init(month: "Oct", count: 3),
                .init(month: "Nov", count: 2),
                .init(month: "Dec", count: 11)]
    }
}

extension FoodStat {
    static func stub() -> [Self] {
        return [.init(category: .chinese, restraunt: "중국집", minutes: 36, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 1))!),
                .init(category: .bunsik, restraunt: "혜미네 떡볶이", minutes: 55, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 2))!),
                .init(category: .korean, restraunt: "뜨끈이 국밥", minutes: 122, money: 3, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 3))!),
                .init(category: .chicken, restraunt: "BHC", minutes: 30, money: 3, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 4))!),
                .init(category: .korean, restraunt: "사당맛집", minutes: 39, money: 3, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 5))!),
                .init(category: .bunsik, restraunt: "대넷분식", minutes: 70, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 6))!),
                .init(category: .korean, restraunt: "이모네 밥상", minutes: 79, money: 3, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 7))!),
                .init(category: .chinese, restraunt: "화룡관", minutes: 91, money: 4, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 8))!),
                .init(category: .chicken, restraunt: "BBQ", minutes: 121, money: 5, date:  Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 9))!),
                .init(category: .western, restraunt: "쟝삐게티", minutes: 40, money: 4, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 10))!),
                .init(category: .bunsik, restraunt: "삼첩분식", minutes: 30, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 11))!),
                .init(category: .korean, restraunt: "이모네 국밥", minutes: 50, money: 5, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 12))!),
                .init(category: .chicken, restraunt: "BBQ", minutes: 101, money: 5, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 1))!),
                .init(category: .chicken, restraunt: "BHC", minutes: 132, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 2))!),
                .init(category: .chinese, restraunt: "중국집", minutes: 32, money: 4, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 3))!),
                .init(category: .bunsik, restraunt: "혜미네 떡볶이", minutes: 31, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 4))!),
                .init(category: .korean, restraunt: "뜨끈이 국밥", minutes: 41, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 5))!),
                .init(category: .chicken, restraunt: "BHC", minutes: 91, money: 5, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 6))!),
                .init(category: .korean, restraunt: "사당맛집", minutes: 62, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 7))!),
                .init(category: .bunsik, restraunt: "대넷분식", minutes: 35, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 8))!),
                .init(category: .korean, restraunt: "이모네 밥상", minutes: 32, money: 8, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 9))!),
                .init(category: .chinese, restraunt: "화룡관", minutes: 42, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 10))!),
                .init(category: .chicken, restraunt: "BBQ", minutes: 67, money: 1, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 11))!),
                .init(category: .western, restraunt: "쟝삐게티", minutes: 66, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2022, month: 12))!),
                .init(category: .bunsik, restraunt: "삼첩분식", minutes: 95, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2023, month: 1))!),
                .init(category: .korean, restraunt: "이모네 국밥", minutes: 111, money: 2, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2023, month: 2))!),
                .init(category: .chicken, restraunt: "BBQ", minutes: 127, money: 3, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2023, month: 3))!),
                .init(category: .chicken, restraunt: "BHC", minutes: 129, money: 5, date: Calendar.autoupdatingCurrent.date(from: DateComponents(year: 2023, month: 4))!)]
    }
}

extension SpendingStat {
    static func stub() -> Self {
        let category = [FormModel.FoodCategory.chicken, FormModel.FoodCategory.korean,
                        FormModel.FoodCategory.bunsik, FormModel.FoodCategory.western,
                        FormModel.FoodCategory.chinese, FormModel.FoodCategory.japanese]
        
        return SpendingStat(values: [20000, 32800, 59000, 19800, 40000, 108000],
                            category: category.map{ $0.description },
                            colors: [.blue, .green, .orange, .yellow, .brown, .indigo])
    }
}
