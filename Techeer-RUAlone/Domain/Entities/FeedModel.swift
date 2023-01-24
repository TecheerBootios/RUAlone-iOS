//
//  FeedModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/11.
//

import Foundation

struct FeedModel: Hashable, Identifiable {
    let id: UUID = UUID()
    let title: String
    let date: Date
    let currentlyGathered: Int
    let hoursPassed: Int
    
    init(title: String,
         date: Date,
         currentlyGathered: Int,
         hoursPassed: Int) {
        self.title = title
        self.date = date
        self.currentlyGathered = currentlyGathered
        self.hoursPassed = hoursPassed
    }
    
}

struct FeedPage: Equatable {
    let page: Int
    let totalPages: Int
    let feeds: [FeedModel]
}
