//
//  KakaoLoginView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/27.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        KakaoSDK.initSDK(appKey: "c7ca7c0efb2b20b72bfebd7c47225099", loggingEnable:false)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
               if (AuthApi.isKakaoTalkLoginUrl(url)) {
                   return AuthController.handleOpenUrl(url: url, options: options)
               }
               return false
    }
}
