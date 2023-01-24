//
//  FeedDetailViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/29.
//

import Foundation
import MapKit

extension FeedDetail {
    class ViewModel: ObservableObject {
        @Published var place: PlaceIdentifier = PlaceIdentifier(lat: 37.334_900, long: -122.009_020)
        @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.334_900-0.0040, longitude: -122.009_020),
                                                   latitudinalMeters: 750, longitudinalMeters: 750)
        
        @Published var details = FeedDetailModel.stub()
    }
}

struct PlaceIdentifier: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D?
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}
