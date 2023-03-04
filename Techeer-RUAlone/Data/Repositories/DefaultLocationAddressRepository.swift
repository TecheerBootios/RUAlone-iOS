//
//  DefaultLocationAddressRepository.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/21.
//

import Foundation

final class DefaultLocationAddressRepository {
    let service: LocationService = LocationService()
}

extension DefaultLocationAddressRepository: LocationAddressRepository {
    func requestUsageAuthorization() {
        service.requestAuthorization()
    }
    
    func updateUserLocation() {
        service.requestLocation()
    }
    
    func search(pointOfInterest: String) {
        service.searchLocalPointsOfInterest(searchText: pointOfInterest)
    }
}
