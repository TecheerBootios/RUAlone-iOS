//
//  VerticalRectangle.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct VerticalRectangle: View {
    let contentText: LocalizedStringKey
    let rectangleColor: Color
    let circleImage: String
    let circleColor: Color
    let iconColor: Color
    
    private let radius: CGFloat = 20
    private let shadowRadius: CGFloat = 10
    private let shadowArea: CGFloat = 5
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(rectangleColor)
            .overlay {
                VStack(alignment: .leading) {
                    Text(contentText)
                        .font(.title3)
                        .shadow(radius: shadowRadius, x: shadowArea, y: shadowArea)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: circleImage)
                          .resizable()
                          .scaledToFit()
                          .foregroundColor(iconColor)
                          .background(circleColor)
                          .clipShape(Circle())
                        Spacer(minLength: 80)
                    }
                }
                .padding()
            }
    }
}
