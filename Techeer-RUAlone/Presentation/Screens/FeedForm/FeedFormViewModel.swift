//
//  FeedFormModelView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/10.
//

import Foundation
import Combine
import MapKit

import os

private let logger = Logger(subsystem: "com.seanhong.KKodiac.Techeer-RUAlone", category: "FeedFormViewModel")

extension FeedForm {
    final class ViewModel: ObservableObject {
        private let locationAddressRepository: LocationAddressRepository
        private var cancellable: AnyCancellable?
        private let chatRepository: ChatRepository
        
        @Published var form: FormModel
        @Published var chatURL: String?
        @Published var mapItem = [MapItem]()
        @Published var selectedMapItem: MapItem? {
            willSet {
                if let newValue = newValue {
                    let newLatitude = newValue.placeMark.coordinate.latitude
                    let newLongitude = newValue.placeMark.coordinate.longitude
                    form.location = Location(latitude: newLatitude, longitude: newLongitude)
                    form.address = newValue.address
                }
            }
        }
        @Published var pointOfInterest = "" {
            didSet { search(pointOfInterest: pointOfInterest) }
        }
        
        init(form: FormModel) {
            self.form = form
            self.locationAddressRepository = DefaultLocationAddressRepository()
            self.chatRepository = DefaultChatRepository()
            self.cancellable = locationAddressRepository.service.searchPublisher.sink { items in
                self.mapItem = items.map({ MapItem(mapItem: $0) })
            }
        }
        
        func updateUserLocation() {
            locationAddressRepository.updateUserLocation()
        }
        
        func submitFeedForm() {
            chatRepository.createChannel(as: form.title)
            self.cancellable = chatRepository.service.chatPublisher.sink { chatURL in
                self.form.chatURL = chatURL
                logger.log("\(self.form.title)")
                logger.log("\(self.form.address)")
                logger.log("\(self.form.limitMember)")
                logger.log("\(self.form.chatURL)")
                logger.log("\(self.form.foodCategory.rawValue)")
                logger.log("\(self.form.location.debugDescription)")
                logger.log("\(self.form.postType.rawValue)")
                logger.log("\(self.form.startAt)")
            }
        }
        
        private func search(pointOfInterest: String) {
            locationAddressRepository.search(pointOfInterest: pointOfInterest)
        }
    }
}

struct MapItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var address: String
    var placeMark: MKPlacemark
    
    init(mapItem: MKMapItem) {
        self.name = mapItem.name ?? ""
        self.address = mapItem.placemark.title ?? ""
        self.placeMark = mapItem.placemark
    }
}
