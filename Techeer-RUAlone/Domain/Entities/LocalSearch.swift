//
//  LocalSearchViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import Foundation
import MapKit
import Combine

struct LocalSearch: Identifiable, Hashable {
    var id = UUID()
    var locationTitle: String
    var locationAddress: String
    
    init(item: MKMapItem) {
        self.locationTitle = item.name ?? ""
        self.locationAddress = item.placemark.title ?? ""
    }
}
