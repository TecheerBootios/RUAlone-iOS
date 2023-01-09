//
//  FeedDetailViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/29.
//

import Foundation
import MapKit

class FeedDetailViewModel: ObservableObject {
    // let offSet: Double = 0.0055
    @Published var isPresented: Bool = true
    @Published var place = PlaceIdentifier(lat: 37.334_900, long: -122.009_020)
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.334_900-0.0055,
                                                                              longitude: -122.009_020),
                                               latitudinalMeters: 750,
                                               longitudinalMeters: 750)
    @Published var details = FeedDetailModel(title: "버거킹 같이 먹어요",
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

struct PlaceIdentifier: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
