//
//  Techeer_RUAloneApp.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct Techeer_RUAloneApp: App {
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey:"c7ca7c0efb2b20b72bfebd7c47225099")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
