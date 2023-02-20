//
//  Techeer_RUAloneApp.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

@main
struct RUAloneApp: App {
    @StateObject var loginViewModel: Login.ViewModel = .init()
    
    init() {
        Configuration.setUp()
        loginViewModel.deleteToken()
    }
    
    var body: some Scene {
        WindowGroup {
            if loginViewModel.isAuthenticated == false {
                Login(viewModel: loginViewModel)
            } else {
                ContentView()
            }
        }
    }
}
