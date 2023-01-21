//
//  FeedRowView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/15.
//

import SwiftUI

struct DetailRowView: View {
    let feed: FeedModel
    
    var body: some View {
        NavigationLink(destination: FeedDetail(viewModel: .init())) {
            HStack {
                Circle()
                    .foregroundColor(.customPurple)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(feed.title)
                    Text(feed.date.toString())
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                .padding(.leading)
                Spacer()
                VStack {
                    Text("Gathered \(feed.currentlyGathered)")
                    Label(title: {
                        Text("Time \(feed.hoursPassed)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }, icon: {
                        Image("ArrowGather")
                            .renderingMode(.original)
                    })
                }
            }
        }
    }
}
