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
        @Published var isNotAuthenticated: Bool = false
        
        func authenticate() {
            Task {
                _ = await validateAuthentication()
                _ = await requestSignUp()
                _ = await requestSignIn()
                _ = await fetchUserData()
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
        
        
        func requestSignUp() async -> Bool {
            return await withCheckedContinuation { continuation in
                NetworkService.signUp(with: SignUpRequestDTO(accessToken: KeyChainService.shared.readToken() ?? "")) { result in
                    switch result {
                    case .success(_):
                        logger.log("[SignUp Success]")
                        continuation.resume(returning: true)
                    case .failure(let error):
                        logger.error("[SignUp Success] \(error)")
                        continuation.resume(returning: false)
                    }
                }
            }
        }
        
        
        func requestSignIn() async -> Bool {
            return await withCheckedContinuation { continuation in
                NetworkService.signIn(with: SignInRequestDTO(accessToken: KeyChainService.shared.readToken() ?? "")) { result in
                    switch result {
                    case .success(let response):
                        logger.log("[Login Success] \(response.data.accessToken)")
                        self.updateToken(response.data.accessToken)
                        self.isNotAuthenticated.toggle()
                        self.saveParameter(response.data.userEmail)
                        continuation.resume(returning: true)
                    case .failure(let error):
                        logger.error("[Login Error] \(error)")
                        continuation.resume(returning: false)
                    }
                }
            }
        }
        
        func fetchUserData() async -> Bool {
            return await withCheckedContinuation { continuation in
                guard let email = CoreDataStorage.shared.fetchParameter() else {
                    logger.error("User email does not exist in Core Data!")
                    continuation.resume(returning: false)
                    return
                }
                NetworkService.fetchUser(with: email) { result in
                    switch result {
                    case .success(let response):
                        logger.log("[User Fetch Success] \(response.data.name)")
                        CoreDataStorage.shared.insertUser(UserEntity(name: response.data.name,
                                                                     email: response.data.email,
                                                                     nickname: response.data.nickName))
                        continuation.resume(returning: true)
                    case .failure(let error):
                        logger.error("[User Fetch Failed] \(error)")
                        continuation.resume(returning: false)
                    }
                }
                
            }
        }
        
        func readToken() -> String? {
            guard let token = KeyChainService.shared.readToken() else {
                logger.error("[KeyChain] Read failed")
                return nil
            }
            return token
        }
        
        func createToken(_ token: String) {
            if KeyChainService.shared.createToken(token) {
                logger.log("[KeyChain] Create successful")
            } else {
                logger.error("[KeyChain] Create failed")
            }
        }
        
        func updateToken(_ token: String) {
            if KeyChainService.shared.updateToken(token) {
                logger.log("[KeyChain] Update successful")
            } else {
                logger.error("[KeyChain] Update failed")
            }
        }
        
        func deleteToken() {
            if KeyChainService.shared.deleteToken() {
                logger.log("[KeyChain] Delete successful")
            } else {
                logger.error("[KeyChain] Create failed")
            }
        }
        
        func saveParameter(_ param: String) {
            CoreDataStorage.shared.insertQueryParameter(param)
        }
    }
}
