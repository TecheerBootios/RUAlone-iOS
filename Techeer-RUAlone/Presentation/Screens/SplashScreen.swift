//
//  SplashScreen.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2023/02/21.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack{
//            Text("혼자 왔니 ?")
//                .font(.system(size: 40, weight: .light, design: .serif))
//                .frame(width: 300, height: 20)
//                .padding(EdgeInsets(top: 200, leading: 20, bottom: 0, trailing: 0))
            LottieView(lottieFile: "women-thinking", contentMode: .scaleAspectFit)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
