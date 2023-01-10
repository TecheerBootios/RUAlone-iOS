//
//  LocalSearchViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import Foundation
import MapKit
import Combine

import os

private let logger = Logger(subsystem: "com.seanhong.KKodiac.Techeer-RUAlone", category: "LocalSearchViewModel")

struct LocalSearch: Identifiable, Hashable {
    var id = UUID()
    var locationTitle: String
    var locationAddress: String
    
    init(mapItem: MKMapItem) {
        self.locationTitle = mapItem.name ?? ""
        self.locationAddress = mapItem.placemark.title ?? ""
    }
}

final class LocalSearchViewModel: ObservableObject {
    private var cancellable: AnyCancellable?

    @Published var poiText = "" {
        didSet {
            searchForPOI(text: poiText)
        }
    }
    
    @Published var data = [LocalSearch]()
    
    var service: LocalSearchService
    
    init() {
        service = LocalSearchService()
        service.requestLocation()
        cancellable = service.localSearchPublisher.sink { mapItems in
            self.data = mapItems.map({ LocalSearch(mapItem: $0) })
        }
    }
    
    private func searchForPOI(text: String) {
        service.searchPointOfInterests(searchText: text)
    }
}
