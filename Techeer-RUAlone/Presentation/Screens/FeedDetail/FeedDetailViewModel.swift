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
        @Published var place: PlaceIdentifier
        @Published var region: MKCoordinateRegion
        @Published var detail: FormModel
        
        let mapOffset = 0.004
        let span: Double = 750
        
        init(detail: FormModel) {
            self.detail = detail
            if let location = detail.location {
                self.place = PlaceIdentifier(lat: location.latitude, long: location.longitude)
            } else {
                self.place = PlaceIdentifier(lat: 37.334_900, long: -122.009_020)
            }
            if let location = detail.location {
                let centerCoordinate = CLLocationCoordinate2D(latitude: location.latitude - mapOffset, longitude: location.longitude)
                self.region = MKCoordinateRegion(center: centerCoordinate, latitudinalMeters: span, longitudinalMeters: span)
            } else {
                let centerCoordinate = CLLocationCoordinate2D(latitude: 37.334_900-0.0040, longitude: -122.009_020)
                self.region = MKCoordinateRegion(center: centerCoordinate, latitudinalMeters: span, longitudinalMeters: span)
            }
        }
        
        func saveToPersistence() {
            CoreDataStorage.shared.insertPost(detail)
        }
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
