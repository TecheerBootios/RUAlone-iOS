//
//  FeedRowView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/15.
//

import SwiftUI

struct FeedRowView: View {
    let title: String
    let date: String
    let gathered: Int
    let hours: Int
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.customPurple)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(title)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading)
            Spacer()
            VStack {
                Text("\(gathered)명 모임")
                Label(title: {
                    Text("\(hours)시간")
                }, icon: {
                    Image("ArrowGather")
                        .renderingMode(.original)
                })
            }
        }
    }
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(title: "버거킹 같이 먹어요.", date: "2022/11/20", gathered: 5, hours: 2)
    }
}
