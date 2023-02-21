//
//  ContentView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        VStack{
            if self.isActive {
                TabView {
                    Home()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    Feed()
                        .tabItem {
                            Label("Post", systemImage: "person.3.fill")
                        }
                    Message()
                        .tabItem {
                            Label("Message", systemImage: "message.fill")
                        }
                }
                .tint(.black)
            } else {
//                Text("혼자 왔니 ?")
//                    .font(.system(size: 40, weight: .light, design: .serif))
//                    .frame(width: 300, height: 20)
//                    .padding(EdgeInsets(top: 200, leading: 20, bottom: 0, trailing: 0))
                LottieView(lottieFile: "women-thinking", contentMode: .scaleAspectFit)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
