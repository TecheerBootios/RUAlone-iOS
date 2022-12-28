//
//  LoginView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser

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
                        .frame(width: 320, height: 340);
                    
                    Button {
                        if (UserApi.isKakaoTalkLoginAvailable()) {
                            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                                    print(oauthToken)
                                    print(error)
                                }
                            } else {
                                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                                    print(oauthToken)
                                print(error)
                                }
                            }
                        } label : {
                        Image("KakaoLogin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width : UIScreen.main.bounds.width * 0.9)
                    }
                })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
