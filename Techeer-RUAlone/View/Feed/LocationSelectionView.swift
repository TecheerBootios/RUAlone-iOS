//
//  LocationSelectionView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import SwiftUI

struct LocationSelectionView: View {
    @ObservedObject var searchViewModel: LocalSearchViewModel
    @ObservedObject var formViewModel: FeedFormViewModel

    var body: some View {
        VStack(alignment: .leading) {
            TextField("음식점을 골라주세요", text: $searchViewModel.poiText)
            Divider()
            Text("Results")
                .font(.title)
            List(searchViewModel.data) { item in
                Button(action: {
                    formViewModel.setLocation(at: item.locationTitle)
                }, label: {
                    VStack(alignment: .leading) {
                        Text(item.locationTitle)
                        Text(item.locationAddress)
                            .foregroundColor(.secondary)
                    }
                })
            }
        }
        .padding(.all)
    }
}
