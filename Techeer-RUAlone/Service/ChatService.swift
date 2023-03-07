//
//  ChatService.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import SendbirdChatSDK
import SwiftUI
import Combine

import os

private let logger = Logger(subsystem: "com.seanhong.KKodiac.Techeer-RUAlone", category: "ChatService")

final class ChatService: NSObject, ObservableObject {
    let chatPublisher = PassthroughSubject<String, Never>()
    
    func createChat(_ name: String, users: [String], isDistinct: Bool = false) {
        let params = GroupChannelCreateParams()
        params.name = name
        params.userIds = users
        params.isDistinct = isDistinct
        
        GroupChannel.createChannel(params: params) { channel, error in
            if let error = error {
                logger.error("\(error)")
                return
            }
            if let channel = channel {
                self.chatPublisher.send(channel.channelURL)
            }
        }
    }

    func deleteChat(_ url: String) {
        GroupChannel.getChannel(url: url) { channel, error in
            guard let channel = channel else { return }
            channel.delete { error in
                guard error == nil else {
                    return
                }
                logger.log("[ChatService] Channel delete successful")
            }
        }
    }
}
