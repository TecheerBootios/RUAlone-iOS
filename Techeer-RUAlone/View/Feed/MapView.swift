//
//  MapView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/28.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: FeedDetailViewModel
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, annotationItems: [viewModel.place]) { place in
            MapAnnotation(coordinate: place.location) {
                Button(action: { viewModel.isPresented.toggle() }, label: {
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.customOrange)
                })
            }
        }
    }
}
