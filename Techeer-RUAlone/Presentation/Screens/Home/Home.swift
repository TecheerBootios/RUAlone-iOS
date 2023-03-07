//
//  HomeView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel: ViewModel = .init()
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    HomeRectangle(rectangleColor: .customWhite, viewModel: viewModel)
                    ActivityRectangle(rectangleColor: .customBlue)
                        .frame(height: geometry.size.height/3)
                }
            }
            .padding()
            .onAppear {
                viewModel.fetchUser()
                viewModel.fetchPosts()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
