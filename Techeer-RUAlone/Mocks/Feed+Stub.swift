//
//  Feed+Stub.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/24.
//

import Foundation

extension FeedModel {
    static func stub(
        title: String = "버거킹 먹자!",
        date: Date = Date(),
        currentlyGathered: Int = 3,
        hoursPassed: Int = 2) -> Self {
        FeedModel(title: title,
                  date: date,
                  currentlyGathered: currentlyGathered,
                  hoursPassed: hoursPassed)
    }
    
    static func stubs() -> [FeedModel] {
        [
           FeedModel(title: "버거킹 먹자!", date: Date(), currentlyGathered: 3, hoursPassed: 2),
           FeedModel(title: "맥도날드 먹자!", date: Date(), currentlyGathered: 1, hoursPassed: 5),
           FeedModel(title: "롯데리아 먹자!", date: Date(), currentlyGathered: 2, hoursPassed: 1),
           FeedModel(title: "스파기티 먹방 기기!", date: Date(), currentlyGathered: 4, hoursPassed: 6),
           FeedModel(title: "고기 씹으러 가자!", date: Date(), currentlyGathered: 1, hoursPassed: 2),
           FeedModel(title: "냠냠 먹태파티", date: Date(), currentlyGathered: 3, hoursPassed: 2),
           FeedModel(title: "냠냠 먹태파티", date: Date(), currentlyGathered: 3, hoursPassed: 2),
           FeedModel(title: "냠냠 먹태파티", date: Date(), currentlyGathered: 3, hoursPassed: 2),
           FeedModel(title: "냠냠 먹태파티", date: Date(), currentlyGathered: 3, hoursPassed: 2),
           FeedModel(title: "냠냠 먹태파티", date: Date(), currentlyGathered: 3, hoursPassed: 2),
           FeedModel(title: "냠냠 먹태파티", date: Date(), currentlyGathered: 3, hoursPassed: 2)
       ]
    }
}
