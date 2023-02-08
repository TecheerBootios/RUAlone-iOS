//
//  HorizontalRectangle.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/10.
//

import SwiftUI

struct HorizontalRectangle: View {
    let contentText: LocalizedStringKey
    let rectangleColor: Color
    let capsuleText: LocalizedStringKey
    let capsuleImage: String
    
    private let radius: CGFloat = 20
    private let shadowRadius: CGFloat = 10
    private let shadowArea: CGFloat = 5
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius)
                .fill(rectangleColor)
                .overlay {
                    ZStack {
                        VStack(alignment: .leading) {
                            Text(contentText)
                                .font(.title2)
                                .shadow(radius: shadowRadius, x: shadowArea, y: shadowArea)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
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
        
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        HorizontalRectangle(contentText: "WelcomeMessage",
                            rectangleColor: .customPurple,
                            capsuleText: "TodaysGathering",
                            capsuleImage: "person")
    }
}
