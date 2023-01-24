//
//  LocationService.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/21.
//

import CoreLocation
import Combine
import MapKit

import os

private let logger = Logger(subsystem: "com.seanhong.KKodiac.Techeer-RUAlone", category: "LocationService")

final class LocationService: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    let searchPublisher = PassthroughSubject<[MKMapItem], Never>()
    
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        self.manager.delegate = self
    }
    
    public func requestLocalLocation() {
        manager.requestLocation()
    }
    
    public func searchLocalPointsOfInterest(searchText: String) {
        request(resultType: .pointOfInterest, searchText: searchText)
    }
    
    public func requestAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            authorizationStatus = .authorizedAlways
        case .authorizedWhenInUse:
            authorizationStatus = .authorizedWhenInUse
        case .restricted:
            authorizationStatus = .restricted
        case .denied:
            authorizationStatus = .denied
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
        @unknown default:
            authorizationStatus = .none
        }
    }
    
    private func request(resultType: MKLocalSearch.ResultType, searchText: String) {
        guard let location = location else { return }
        let radius: CLLocationDistance = 350_000
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.pointOfInterestFilter = .includingAll
        request.resultTypes = resultType
        request.region = MKCoordinateRegion(center: location, latitudinalMeters: radius, longitudinalMeters: radius)
        let search = MKLocalSearch(request: request)
        search.start { [weak self] (response, error) in
            guard let response = response else { return }
            self?.searchPublisher.send(response.mapItems)
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        DispatchQueue.main.async {
            self.location = location.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        logger.error("\(error.localizedDescription)")
    }
}
