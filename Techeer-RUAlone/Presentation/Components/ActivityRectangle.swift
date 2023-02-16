//
//  HorizontalRectangle.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct ActivityRectangle: View {
    let rectangleColor: Color
    
    private let radius: CGFloat = 20
    private let shadowRadius: CGFloat = 10
    private let shadowArea: CGFloat = 5
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            TabView {
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.customBlue)
                    .overlay {
                        GatherChart()
                    }
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.black)
                    .overlay {
                        MoneyChart()
                    }
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.customLightOrange)
                    .overlay {
                        TimeChart()
                    }
            }
            .tabViewStyle(.page)
            .shadow(radius: 50)
        }
        
        
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        ActivityRectangle(rectangleColor: .customBlue)
    }
}
