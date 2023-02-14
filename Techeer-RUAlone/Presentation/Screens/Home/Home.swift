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
                    HomeRectangle(rectangleColor: .customWhite)
                    ActivityRectangle(rectangleColor: .customBlue)
                        .frame(height: geometry.size.height/3)
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
