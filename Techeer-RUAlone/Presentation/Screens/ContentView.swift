//
//  ContentView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @StateObject var loginViewModel: Login.ViewModel = .init()
    
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
        .task {
            loginViewModel.deleteToken()
            try? await Task.sleep(for: Duration.seconds(5))
            self.launchScreenState.dismiss()
        }
        .fullScreenCover(isPresented: $loginViewModel.isNotAuthenticated) {
            Login(viewModel: loginViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
