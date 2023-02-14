//
//  ChatRepository.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import Foundation

protocol ChatRepository {
    var service: ChatService { get }
    func createChannel()
    func deleteChannel()
}
