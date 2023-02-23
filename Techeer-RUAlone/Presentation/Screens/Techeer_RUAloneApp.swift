//
//  Techeer_RUAloneApp.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

@main
struct RUAloneApp: App {
    @StateObject var launchScreenState = LaunchScreenStateManager()

    init() {
        Configuration.setUp()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
