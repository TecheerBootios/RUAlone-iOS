//
//  FeedDetail+Stub.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import Foundation

extension FeedDetailModel {
    static func stub() -> Self {
        let chatURLString = "sendbird_group_channel_104288745_01714e67ffa2f3be0dbf8796492e06c172bdc321"
        let coordinates = PlaceCoordinates(latitude: 37.334_900, longitude: -122.009_020,
                                           latitudinalMeters: 750, longitudinalMeters: 750)
        return FeedDetailModel(title: "버거킹 같이 먹어요",
                               timestamp: 2,
                               startAt: "17:00 ~ 00:00",
                               foodCategory: "양식",
                               chatURLString: chatURLString,
                               currentMemeber: 3,
                               limitMember: 5,
                               place: "버거킹 시흥점",
                               coordinates: coordinates)
    }
}
