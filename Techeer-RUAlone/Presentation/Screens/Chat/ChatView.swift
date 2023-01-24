//
//  ChatView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/26.
//

import SwiftUI
import SendbirdUIKit

import os

private let logger = Logger.init(subsystem: "com.techeer.KKodiac.Techeer-RUAlone", category: "ChatView")

struct ChatView: View {
    let channelURL: String
    
    init(channelURL: String) {
        SBUGlobals.currentUser = SBUUser(userId: "Test")
        SendbirdUI.connect { (user, error) in
            guard user != nil else {
                logger.error("Sendbird Init: Connection Error \(String(describing: error))")
                return
            }
        }
        self.channelURL = channelURL
    }
    var body: some View {
        ChatViewContainer(channelURL: channelURL)
    }
}

struct ChatViewContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let channel = SendbirdUIKitController(channelURL: channelURL)
        let navigationViewController = UINavigationController(rootViewController: channel)
        return navigationViewController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) { }
    
    typealias UIViewControllerType = UINavigationController
    let channelURL: String
}

class SendbirdUIKitController: SBUGroupChannelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
