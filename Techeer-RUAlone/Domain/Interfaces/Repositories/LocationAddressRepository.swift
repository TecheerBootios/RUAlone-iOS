//
//  LocationAddressRepository.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/21.
//

import Foundation

protocol LocationAddressRepository {
    var service: LocationService { get }
    
    func requestUsageAuthorization()
    func updateUserLocation()
    func search(pointOfInterest: String)
}
