//
//  FeedViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/26.
//

import Foundation

import os

private let logger = Logger(subsystem: "com.seanhong.KKodiac.Techeer-RUAlone", category: "FeedViewModel")

extension Feed {
    final class ViewModel: ObservableObject {
        private let locationManager: LocationAddressRepository
        
        @Published var feeds: [FormModel] = []
        
        init(locationManager: LocationAddressRepository = DefaultLocationAddressRepository()) {
            self.locationManager = locationManager
        }
        
        func requestUsageAuthorization() {
            locationManager.requestUsageAuthorization()
        }
        
        func requestUserLocation() {
            locationManager.updateUserLocation()
        }
        
        func fetchPosts() {
            NetworkService.fetchPosts { result in
                switch result {
                case .success(let response):
                    logger.log("[Success] \(response.list.count)")
                    self.feeds = response.list.reversed().map { FormModel(data: $0) }
                case .failure(let error):
                    logger.error("[Error] \(error.localizedDescription)")
                }
            }
        }
        
        func fetchPostsWithDistance() {
            self.requestUserLocation()
            guard let location = locationManager.service.location.map ({ Location(latitude: $0.latitude, longitude: $0.longitude) }) else {
                return 
            }
            NetworkService.fetchPostsWithDistance(with: location) { result in
                switch result {
                case .success(let response):
                    logger.log("[Success] \(response.list.count)")
                    self.feeds = response.list.reversed().map { FormModel(data: $0) }
                case .failure(let error):
                    logger.error("[Error] \(error.localizedDescription)")
                }
            }
        }
    }
}
