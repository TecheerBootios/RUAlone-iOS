//
//  DefaultChatRepository.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import Foundation

final class DefaultChatRepository {
    let service: ChatService = ChatService()
}

extension DefaultChatRepository: ChatRepository {
    func createChannel() {
        service.createChat(name: "", users: [])
    }
    
    func deleteChannel() {
        // Call Post DB for Channel URL
        service.deleteChat("")
    }
}
