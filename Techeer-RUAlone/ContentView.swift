//
//  ContentView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                }
            FeedView()
                .tabItem {
                    Label("게시판", systemImage: "person.3.fill")
                }
            MessageView()
                .tabItem {
                    Label("메세지", systemImage: "person.3.fill")
                }
        }
        .tint(.black)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
