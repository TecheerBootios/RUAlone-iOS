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

struct Login: View {
    @ObservedObject var viewModel: ViewModel = .init()
    
    var body: some View {
        Color.customBackground
            .ignoresSafeArea()
            .overlay(
                VStack {
                    LottieView(lottieFile: "food-carousel", contentMode: .scaleAspectFit)
                        .frame(width: 300, height: 300)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                    Button {
                        if UserApi.isKakaoTalkLoginAvailable() == true {
                            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                                guard let oauthToken = oauthToken else {
                                    logger.error("\(error.debugDescription)")
                                    return
                                }
                                viewModel.createToken(oauthToken.accessToken)
                                logger.log("\(oauthToken.accessToken)")
                            }
                        } else {
                            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                                guard let oauthToken = oauthToken else {
                                    logger.error("\(error.debugDescription)")
                                    return
                                }
                                viewModel.createToken(oauthToken.accessToken)
                                logger.log("\(oauthToken.accessToken)")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Login(viewModel: .init())
            .environment(\.locale, .init(identifier: "ko"))
    }
}
