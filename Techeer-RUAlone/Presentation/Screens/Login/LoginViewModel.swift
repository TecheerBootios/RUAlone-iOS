//
//  LoginViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import Foundation
import os

private let logger = Logger.init(subsystem: "com.techeer.KKodiac.Techeer-RUAlone", category: "LoginViewModel")

extension Login {
    class ViewModel: ObservableObject {
        @Published var isAuthenticated: Bool = false
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
