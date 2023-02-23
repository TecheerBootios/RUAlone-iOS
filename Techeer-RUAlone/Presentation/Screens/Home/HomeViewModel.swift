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
        
        func fetchUser() {
            if let user = CoreDataStorage.shared.fetchUser() {
                header = String(format: NSLocalizedString("Header %@", comment: ""), user.name)
            } else {
                header = NSLocalizedString("Login Header", comment: "")
                return
            }
        }
    }
}
