//
//  HorizontalRectangle.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct HorizontalRectangle: View {
    let contentText: String
    let rectangleColor: Color
    let capsuleText: String
    let capsuleImage: String
    let radius: CGFloat = 20
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(rectangleColor)
            .overlay {
                VStack(alignment: .leading) {
                    Text(contentText)
                        .font(.title2)
                        .shadow(radius: 10, x: 5, y: 5)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    HStack(alignment: .bottom) {
                        Label(capsuleText, systemImage: capsuleImage)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding()
                            .background(in: Capsule())
                        Spacer()
                    }
                }.padding()
            }
    }
}

struct HorizontalRectangle_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRectangle(contentText: "어서오세요, 홍길동님!",
                            rectangleColor: .customPurple,
                            capsuleText: "오늘의 모임",
                            capsuleImage: "person")
    }
}
