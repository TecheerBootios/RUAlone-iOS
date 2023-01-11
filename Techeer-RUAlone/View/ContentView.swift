//
//  ContentView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
    private let homeText: LocalizedStringKey = "Home"
    private let postText: LocalizedStringKey = "Post"
    private let messageText: LocalizedStringKey = "Message"
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(homeText, systemImage: "house.fill")
                }
            FeedView()
                .tabItem {
                    Label(postText, systemImage: "person.3.fill")
                }
            MessageView()
                .tabItem {
                    Label(messageText, systemImage: "message.fill")
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
