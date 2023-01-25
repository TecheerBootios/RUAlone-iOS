//
//  Environment.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import Foundation
import SendbirdUIKit
import KakaoSDKCommon
import KakaoSDKAuth

import os

private let logger = Logger.init(subsystem: "com.techeer.KKodiac.Techeer-RUAlone", category: "Init")

struct Configuration {
    private enum Constant {
        static let appID: String = "B63A605C-5AA3-4540-A296-83CAFB32E557"
        static let appKey: String = "c7ca7c0efb2b20b72bfebd7c47225099"
    }
    
    static func setUp() {
        SendbirdUI.initialize(applicationId: Constant.appID) { (error) in
            guard error != nil else {
                logger.error("Sendbird Init: Initialization Error \(String(describing: error))")
                return
            }
        }
        SBUGlobals.currentUser = SBUUser(userId: "TestA")
        SendbirdUI.connect { (user, error) in
            guard user != nil else {
                logger.error("[SendbirdUI] Connect: User offline and No local cache.")
                return
            }
            if error != nil {
                logger.error("[SendbirdUI] Connect: The user is offline.")
            }
            else {
                logger.log("[SendbirdUI] Connect: User connected \(user)")
            }
        }
        KakaoSDK.initSDK(appKey: Constant.appKey)
    }
}
