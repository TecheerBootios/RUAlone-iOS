//
//  LoginViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

import os

private let logger = Logger.init(subsystem: "com.techeer.KKodiac.Techeer-RUAlone", category: "LoginViewModel")

extension Login {
    class ViewModel: ObservableObject {
        @Published var isAuthenticated: Bool = false
        
        func authenticate() {
            Task {
                _ = await validateAuthentication()
                NetworkService.signIn(with: SignInRequestDTO(accessToken: KeyChainService.shared.readToken() ?? "")) { result in
                    switch result {
                    case .success(let response):
                        logger.log("[Login Success] \(response.data.accessToken)")
                        self.createToken(response.data.accessToken)
                    case .failure(let error):
                        logger.error("[Login Error] \(error)")
                    }
                }
            }
        }
        
        func validateAuthentication() async -> Bool {
            return await withCheckedContinuation { continuation in
                if UserApi.isKakaoTalkLoginAvailable() == true {
                    UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                        guard let oauthToken = oauthToken else {
                            logger.error("\(error.debugDescription)")
                            continuation.resume(returning: false)
                            return
                        }
                        self.createToken(oauthToken.accessToken)
                        logger.log("[Access Token] \(oauthToken.accessToken)")
                        continuation.resume(returning: true)
                    }
                } else {
                    UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                        guard let oauthToken = oauthToken else {
                            logger.error("\(error.debugDescription)")
                            continuation.resume(returning: false)
                            return
                        }
                        self.createToken(oauthToken.accessToken)
                        logger.log("[Access Token] \(oauthToken.accessToken)")
                        continuation.resume(returning: true)
                    }
                }
            }
            
        }
        
        func readToken() -> String? {
            guard let token = KeyChainService.shared.readToken() else {
                logger.error("[KeyChain] Read failed")
                return nil
            }
            print("READ \(token)")
            return token
        }
        
        func createToken(_ token: String) {
            if KeyChainService.shared.createToken(token) {
                logger.log("[KeyChain] Create successful")
                isAuthenticated.toggle()
            } else {
                logger.error("[KeyChain] Create failed")
            }
        }
        
        func updateToken(_ token: String) {
            if KeyChainService.shared.updateToken(token) {
                logger.log("[KeyChain] Create successful")
            } else {
                logger.error("[KeyChain] Create failed")
            }
        }
        
        func deleteToken() {
            if KeyChainService.shared.deleteToken() {
                logger.log("[KeyChain] Create successful")
            } else {
                logger.error("[KeyChain] Create failed")
            }
        }
    }
}
