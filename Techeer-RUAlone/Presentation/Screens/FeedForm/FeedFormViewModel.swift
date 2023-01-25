//
//  FeedFormModelView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/10.
//

import Foundation
import Combine

protocol FeedFormViewModelInput {
    func updateUserLocation()
}

protocol FeedFormViewModelOutput {
    var title: String { get }
    var address: String { get }
    var startAt: Date { get }
    var limitMember: Int { get }
    var foodCategory: Form.FoodCategory { get }
}

protocol FeedFormViewModel: FeedFormViewModelInput, FeedFormViewModelOutput { }

extension FeedForm {
    final class ViewModel: ObservableObject, FeedFormViewModel {
        private let locationAddressRepository: LocationAddressRepository
        private var cancellable: AnyCancellable?
        private let chatRepository: ChatRepository
        
        @Published var data = [LocalSearch]()
        @Published var pointOfInterest = "" {
            didSet { search(pointOfInterest: pointOfInterest) }
        }
        
        // MARK: Output
        @Published var title: String
        @Published var address: String
        @Published var startAt: Date
        @Published var limitMember: Int
        @Published var foodCategory: Form.FoodCategory
        @Published var postType: Form.PostType
        
        init(form: Form,
             locationAddressRepository: LocationAddressRepository = DefaultLocationAddressRepository(),
             chatRepository: ChatRepository = DefaultChatRepository()) {
            self.title = form.title
            self.address = form.address
            self.startAt = form.startAt
            self.limitMember = form.limitMember
            self.foodCategory = form.foodCategory
            self.postType = form.postType
            self.locationAddressRepository = locationAddressRepository
            self.chatRepository = chatRepository
            self.cancellable = locationAddressRepository.service.searchPublisher.sink { items in
                self.data = items.map({ LocalSearch(item: $0) })
            }
        }
        
        func updateUserLocation() {
            locationAddressRepository.updateUserLocation()
        }
        
        func createNewChannel() {
            chatRepository.createChannel()
        }
        
        private func search(pointOfInterest: String) {
            locationAddressRepository.search(pointOfInterest: pointOfInterest)
        }
    }
}
