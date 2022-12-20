//
//  MesseageRowView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI

struct MesseageRowView: View {
    let title: String
    let time: String
    let chat: String
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.customPurple)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(title)
                Text(chat)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading)
            Spacer()
            VStack {
                Text("\(time)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Label(title: {
                }, icon: {
                    Image("ArrowGather")
                        .renderingMode(.original)
                })
            }
        }
    }
}

struct MesseageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MesseageRowView(title: "우육탕면 팟", time: "4:30 PM", chat: "그때 만나요!")
    }
}
