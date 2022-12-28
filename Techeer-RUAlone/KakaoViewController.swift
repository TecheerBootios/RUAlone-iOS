//
//  KakaoViewController.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/27.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser

class KakaoViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 앱으로 로그인
    @IBAction func onKakaoLoginByAppTouched(_ sender: Any) {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    // do something
                    _ = oauthToken
                    // 어세스토큰
                    let accessToken = oauthToken?.accessToken

                    //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                    self.setUserInfo()
                }
            }
        }

    }
    
    
    //폰(시뮬레이터)에 앱이 안깔려 있을때 웹 브라우저를 통해 로그인
    @IBAction func onKakaoLoginByWebTouched(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                // 어세스토큰
                let accessToken = oauthToken?.accessToken
                
                //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                self.setUserInfo()
            }
        }
    }
    
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                self.infoLabel.text = user?.kakaoAccount?.profile?.nickname
                
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                    let data = try? Data(contentsOf: url) {
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
    }
}

