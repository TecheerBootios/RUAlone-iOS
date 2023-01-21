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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
