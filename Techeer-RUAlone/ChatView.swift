//
//  ChatView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/26.
//

import SwiftUI
import SendbirdUIKit

struct ChatView: View {
    let appID = "B63A605C-5AA3-4540-A296-83CAFB32E557"
    let channelURL = "sendbird_group_channel_104288745_01714e67ffa2f3be0dbf8796492e06c172bdc321"
    
    init() {
        SendbirdUI.initialize(applicationId: appID) { (error) in
            print("Sendbird Init: Initialization Error \(String(describing: error))")
        }
        SBUGlobals.currentUser = SBUUser(userId: "Test")
        SendbirdUI.connect { (user, error) in
            guard let _ = user else {
                print("Sendbird Init: Connection Error \(String(describing: error))")
                return
            }
        }
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
