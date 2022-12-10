//
//  VerticalRectangle.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct VerticalRectangle: View {
    let contentText: String
    let rectangleColor: Color
    let circleImage: String
    let circleColor: Color
    let iconColor: Color
    let radius: CGFloat = 20
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(rectangleColor)
            .overlay {
                VStack(alignment: .leading) {
                    Text(contentText)
                        .font(.title3)
                        .shadow(radius: 10, x: 5, y: 5)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: circleImage)
                          .resizable()
                          .frame(width: 23, height: 23)
                          .foregroundColor(iconColor)
                          .padding(20)
                          .background(circleColor)
                          .clipShape(Circle())
                        Spacer(minLength: 80)
                    }
                }
                .padding()
            }
    }
}

struct VerticalRectangle_Previews: PreviewProvider {
    static var previews: some View {
        VerticalRectangle(contentText: "친구를 찾아보세요!",
                          rectangleColor: .customGreen,
                          circleImage: "person.fill.questionmark",
                          circleColor: .customLightGreen,
                          iconColor: .customGreen)
    }
}
