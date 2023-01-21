//
//  FeedDetailModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/28.
//

import Foundation

struct FeedDetailModel: Identifiable {
    let id: UUID
    let title: String
    let timestamp: Int
    let startAt: String
    let foodCategory: String
    let chatURLString: String
    let currentMemeber: Int
    let limitMember: Int
    let place: String
    let coordinates: PlaceCoordinates
    
    init(id: UUID = UUID(),
         title: String,
         timestamp: Int,
         startAt: String,
         foodCategory: String,
         chatURLString: String,
         currentMemeber: Int,
         limitMember: Int,
         place: String,
         coordinates: PlaceCoordinates) {
        self.id = id
        self.title = title
        self.timestamp = timestamp
        self.startAt = startAt
        self.foodCategory = foodCategory
        self.chatURLString = chatURLString
        self.currentMemeber = currentMemeber
        self.limitMember = limitMember
        self.place = place
        self.coordinates = coordinates
    }
}

struct PlaceCoordinates: Codable {
    let latitude: Float
    let longitude: Float
    let latitudinalMeters: Int
    let longitudinalMeters: Int
}

struct ExampleFeedDetailModel {
    let mock: FeedDetailModel = FeedDetailModel(title: "버거킹 같이 먹어요",
                                                 timestamp: 2,
                                                 startAt: "17:00 ~ 00:00",
                                                 foodCategory: "양식",
                                                 chatURLString: "sendbird_group_channel_104288745_01714e67ffa2f3be0dbf8796492e06c172bdc321",
                                                 currentMemeber: 3,
                                                 limitMember: 5,
                                                 place: "버거킹 시흥점",
                                                 coordinates: PlaceCoordinates(latitude: 37.334_900,
                                                                             longitude: -122.009_020,
                                                                             latitudinalMeters: 750,
                                                                             longitudinalMeters: 750))
}

