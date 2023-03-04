//
//  FeedRowView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/15.
//

import SwiftUI

struct DetailRowView: View {
    let feed: FormModel
    let index: Int
    let foodCategory = FormModel.FoodCategory.allCases
    let colors: [Color] = [.customPurpleComplement,
                           .customRed,
                           .customBlue,
                           .customMint,
                           .customGreen,
                           .customOrange,
                           .customYellow,
                           .customLightGreen]
    
    
    
    var body: some View {
        NavigationLink(destination: FeedDetail(viewModel: .init(detail: feed))) {
            HStack {
                Circle()
                    .foregroundColor(colors[index % colors.count])
                    .frame(width: 60, height: 60)
                    .overlay {
                        Image(foodCategory[index % foodCategory.count].rawValue)
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                VStack(alignment: .leading) {
                    Text(feed.title)
                    Text("\(feed.startAt.formatted(date: .abbreviated, time: .shortened))")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                .padding(.leading)
                Spacer()
                VStack {
                    Text("Gathered \(feed.limitMember)")
                    Label(title: {
                        Text("Time \(Int(feed.startAt.timeIntervalSinceNow / 3600))")
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
