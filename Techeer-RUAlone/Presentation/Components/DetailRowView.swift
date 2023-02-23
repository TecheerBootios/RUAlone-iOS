//
//  FeedRowView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/15.
//

import SwiftUI

struct DetailRowView: View {
    let feed: FeedModel
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
        NavigationLink(destination: FeedDetail(viewModel: .init())) {
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
                    Text("\(feed.date)")
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

struct DetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRowView(feed: FeedModel.stubs().first!, index: 0)
    }
}
