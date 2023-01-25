//
//  HomeView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    HorizontalRectangle(contentText: "WelcomeMessage",
                                        rectangleColor: .customPurple,
                                        capsuleText: "TodaysGathering",
                                        capsuleImage: "person")
                    .frame(height: geometry.size.height/3.6)
                    HStack(spacing: 12) {
                        VerticalRectangle(contentText: "FindFriend",
                                          rectangleColor: .customGreen,
                                          circleImage: "person.2.fill",
                                          circleColor: .customLightGreen,
                                          iconColor: .customGreen)
                        VerticalRectangle(contentText: "GatherFriend",
                                          rectangleColor: .customOrange,
                                          circleImage: "person.2.wave.2.fill",
                                          circleColor: .customLightOrange,
                                          iconColor: .customDarkOrange)
                    }
                    HorizontalRectangle(contentText: "RecentGathering",
                                        rectangleColor: .customBlue,
                                        capsuleText: "CheckGathering",
                                        capsuleImage: "note")
                    .frame(height: geometry.size.height/3.6)
                }
            }
            .padding()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
