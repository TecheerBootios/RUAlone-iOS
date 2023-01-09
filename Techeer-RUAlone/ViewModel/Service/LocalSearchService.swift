//
//  LocalSearchService.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import Combine
import MapKit

final class LocalSearchService {
    let localSearchPublisher = PassthroughSubject<[MKMapItem], Never>()
    private let center: CLLocationCoordinate2D
    private let radius: CLLocationDistance
    
    init(in center: CLLocationCoordinate2D,
         radius: CLLocationDistance = 350_000) {
        self.center = center
        self.radius = radius
    }
    
    public func searchPointOfInterests(searchText: String) {
        request(searchText: searchText)
    }
    
    private func request(resultType: MKLocalSearch.ResultType = .pointOfInterest,
                         searchText: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.pointOfInterestFilter = .includingAll
        request.resultTypes = resultType
        request.region = MKCoordinateRegion(center: center,
                                            latitudinalMeters: radius,
                                            longitudinalMeters: radius)
        let search = MKLocalSearch(request: request)
        
        search.start { [weak self] (response, _) in
            guard let response = response else {
                return
            }
            
            self?.localSearchPublisher.send(response.mapItems)
        }
    }
}
