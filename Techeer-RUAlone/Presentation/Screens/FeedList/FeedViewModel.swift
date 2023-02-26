//
//  FeedViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/26.
//

import Foundation

extension Feed {
    final class ViewModel: ObservableObject {
        private let locationManager: LocationAddressRepository
        
        init(locationManager: LocationAddressRepository = DefaultLocationAddressRepository()) {
            self.locationManager = locationManager
        }
        
        func requestUsageAuthorization() {
            locationManager.requestUsageAuthorization()
        }
        
        func requestUserLocation() {
            locationManager.updateUserLocation()
        }
    }
}
