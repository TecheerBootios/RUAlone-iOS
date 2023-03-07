//
//  HomeViewModel.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/23.
//

import Foundation

import os

private let logger = Logger.init(subsystem: "com.techeer.KKodiac.Techeer-RUAlone", category: "HomeViewModel")


extension Home {
    final class ViewModel: ObservableObject {
        @Published var header: String = ""
        @Published var user: UserEntity? = nil
        @Published var dates: [Date] = []
        @Published var chatURL: String = ""
        @Published var selectedDate: Date = Date()
        
        func fetchUser() {
            if let user = CoreDataStorage.shared.fetchUser() {
                header = String(format: NSLocalizedString("Header %@", comment: ""), user.name)
            } else {
                header = NSLocalizedString("Login Header", comment: "")
                return
            }
        }
        
        func fetchPosts() {
            if let post = CoreDataStorage.shared.fetchPost() {
                dates = post.map { $0.startAt }
            } else {
                logger.error("Unable to fetch joined posts from core data")
                return
            }
        }
        
        func fetchChatURL() {
            if let post = CoreDataStorage.shared.fetchPost(),
               let selectedPost = post.filter({ $0.startAt.formatted(date: .complete, time: .omitted) == selectedDate.formatted(date: .complete, time: .omitted) }).first {
                chatURL = selectedPost.chatURL
            } else {
                logger.error("Unable to fetch joined post's chat url")
                return
            }
        }
    }
}
