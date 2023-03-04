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
                let dto = self.convertToDTO()
                logger.log("[DTO] \(dto.creatorEmail!)")
                logger.log("[DTO] \(dto.chatURL!)")
                logger.log("[DTO] \(dto.startAt!)")
                logger.log("[DTO] \(dto.location.debugDescription)")
                NetworkService.createPost(with: dto) { result in
                    switch result {
                    case .success(let response):
                        logger.log("[Success] \(response.code)")
                    case .failure(let error):
                        logger.error("[Error] \(error.localizedDescription)")
                    }
                }
            }
        }
        
        private func convertToDTO() -> PostCreateRequestDTO {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            let date = dateFormatter.string(from: form.startAt)
            var dto = PostCreateRequestDTO()
            if let user = CoreDataStorage.shared.fetchUser() {
                dto.chatURL = form.chatURL
                dto.creatorEmail = user.email
                dto.startAt = date
                dto.location = form.location
                dto.postType = form.postType.rawValue
                dto.foodCategory = form.foodCategory.rawValue
                dto.limitMember = form.limitMember
                dto.title = form.title
                dto.place = form.address
            }
            return dto
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
