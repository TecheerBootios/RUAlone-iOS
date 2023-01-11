//
//  HomeView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct HomeView: View {
    private let welcomeText: LocalizedStringKey = "WelcomeMessage"
    private let todaysGatheringText: LocalizedStringKey = "TodaysGathering"
    private let findFriendText: LocalizedStringKey = "FindFriend"
    private let gatherFriendText: LocalizedStringKey = "GatherFriend"
    private let recentGatheringText: LocalizedStringKey = "RecentGathering"
    private let checkGatheringText: LocalizedStringKey = "CheckGathering"
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    HorizontalRectangle(contentText: welcomeText,
                                        rectangleColor: .customPurple,
                                        capsuleText: todaysGatheringText,
                                        capsuleImage: "person")
                    .frame(height: geometry.size.height/3.6)
                    HStack(spacing: 12) {
                        VerticalRectangle(contentText: findFriendText,
                                          rectangleColor: .customGreen,
                                          circleImage: "person.2.fill",
                                          circleColor: .customLightGreen,
                                          iconColor: .customGreen)
                        VerticalRectangle(contentText: gatherFriendText,
                                          rectangleColor: .customOrange,
                                          circleImage: "person.2.wave.2.fill",
                                          circleColor: .customLightOrange,
                                          iconColor: .customDarkOrange)
                    }
                    HorizontalRectangle(contentText: recentGatheringText,
                                        rectangleColor: .customBlue,
                                        capsuleText: checkGatheringText,
                                        capsuleImage: "note")
                    .frame(height: geometry.size.height/3.6)
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
