//
//  LocalSearchService.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import Combine
import MapKit
import CoreLocation

final class LocalSearchService: NSObject, CLLocationManagerDelegate {
    let localSearchPublisher = PassthroughSubject<[MKMapItem], Never>()
    private let locationManager = CLLocationManager()
    private var location: CLLocationCoordinate2D?
    private let radius: Double = 350_000
    var authorizationStatus: CLAuthorizationStatus?

    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func searchPointOfInterests(searchText: String) {
        request(searchText: searchText)
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            // Insert code here of what should happen when Location services are authorized
            authorizationStatus = .authorizedWhenInUse
            locationManager.requestLocation()
        case .restricted:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .restricted
        case .denied:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .denied
        case .notDetermined:        // Authorization not determined yet.
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    private func request(resultType: MKLocalSearch.ResultType = .pointOfInterest,
                         searchText: String) {
        guard let location = self.location else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.pointOfInterestFilter = .includingAll
        request.resultTypes = resultType
        request.region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: radius,
                                            longitudinalMeters: radius)
        let search = MKLocalSearch(request: request)
        
        search.start { [weak self] (response, _) in
            guard let response = response else { return }
            self?.localSearchPublisher.send(response.mapItems)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        DispatchQueue.main.async {
            self.location = location.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR: \(error.localizedDescription)")
    }
}
