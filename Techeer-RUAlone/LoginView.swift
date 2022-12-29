//
//  LoginView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser

import os

private let logger = Logger.init(subsystem: "com.techeer.KKodiac.Techeer-RUAlone", category: "LoginView")

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        Color.customBackground
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Image("MainIcon")
                        .resizable()
                        .frame(width: 320, height: 340)
                    
                    Button {
                        if UserApi.isKakaoTalkLoginAvailable() == true {
                            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                                guard error != nil else {
                                    logger.error("\(error.debugDescription)")
                                    return
                                }
                                logger.log("\(oauthToken.debugDescription)")
                            }
                        } else {
                            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                                guard error != nil else {
                                    logger.error("\(error.debugDescription)")
                                    return
                                }
                                logger.log("\(oauthToken.debugDescription)")
                            }
                        }
                    } label: {
                        Image("KakaoLogin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                    }
                })
    }
}
