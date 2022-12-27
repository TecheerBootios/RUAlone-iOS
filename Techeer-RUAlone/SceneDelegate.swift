//
//  SceneDelegate.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/27.
//

import SwiftUI
import KakaoSDKAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
}
