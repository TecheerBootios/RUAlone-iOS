//
//  HomeView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    HorizontalRectangle(contentText: "어서오세요, 홍길동님!",
                                        contentImage: "HomeButtonImage",
                                        rectangleColor: .customPurple,
                                        capsuleText: "오늘의 모임",
                                        capsuleImage: "person")
                    .frame(height: geometry.size.height/3.6)
                    HStack(spacing: 12) {
                        VerticalRectangle(contentText: "친구를 찾아보세요!",
                                          rectangleColor: .customGreen,
                                          circleImage: "person.2.fill",
                                          circleColor: .customLightGreen,
                                          iconColor: .customGreen)
                        VerticalRectangle(contentText: "친구를 모아보세요!",
                                          rectangleColor: .customOrange,
                                          circleImage: "person.2.wave.2.fill",
                                          circleColor: .customLightOrange,
                                          iconColor: .customDarkOrange)
                    }
                    HorizontalRectangle(contentText: "최근 나의 모임 기록",
                                        contentImage: "GatheringButtonImage",
                                        rectangleColor: .customBlue,
                                        capsuleText: "확인하기",
                                        capsuleImage: "note")
                    .frame(height: geometry.size.height/3.6)
                }
            }
            .padding()
            .navigationTitle("홈")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
