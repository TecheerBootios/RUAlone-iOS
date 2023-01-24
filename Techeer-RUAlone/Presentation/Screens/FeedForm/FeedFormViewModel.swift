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
        
        init(form: Form, locationAddressRepository: LocationAddressRepository = DefaultLocationAddressRepository()) {
            self.title = form.title
            self.address = form.address
            self.startAt = form.startAt
            self.limitMember = form.limitMember
            self.foodCategory = form.foodCategory
            self.locationAddressRepository = locationAddressRepository
            self.cancellable = locationAddressRepository.service.searchPublisher.sink { items in
                print(items)
                self.data = items.map({ LocalSearch(item: $0) })
            }
        }
        
        func updateUserLocation() {
            locationAddressRepository.updateUserLocation()
        }
        
        private func search(pointOfInterest: String) {
            locationAddressRepository.search(pointOfInterest: pointOfInterest)
        }
    }
}
