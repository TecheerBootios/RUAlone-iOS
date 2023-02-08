//
//  Techeer_RUAloneApp.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

@main
struct Techeer_RUAloneApp: App {
    init() {
        Configuration.setUp()
            
    }
    
    var body: some Scene {
        WindowGroup {
            if KeyChainService.shared.requiresLogin() {
                Login()
            } else {
                ContentView()
            }
        }
    }
}
