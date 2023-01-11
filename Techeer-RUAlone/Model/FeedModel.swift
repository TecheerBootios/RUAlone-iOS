//
//  FeedModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/11.
//

import Foundation

struct ExampleFeedModel {
    let feeds: [FeedModel] = [
        FeedModel(title: "버거킹 먹자!", date: Date(), currentlyGathered: 3, hoursPassed: 2),
        FeedModel(title: "맥도날드 먹자!", date: Date(), currentlyGathered: 1, hoursPassed: 5),
        FeedModel(title: "롯데리아 먹자!", date: Date(), currentlyGathered: 2, hoursPassed: 1),
        FeedModel(title: "스파기티 먹방 기기!", date: Date(), currentlyGathered: 4, hoursPassed: 6),
        FeedModel(title: "고기 씹으러 가자!", date: Date(), currentlyGathered: 1, hoursPassed: 2),
        FeedModel(title: "냠냠 먹태파티", date: Date(), currentlyGathered: 3, hoursPassed: 2),
        
    ]
}

struct FeedModel: Hashable {
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
