//
//  MessageView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI
import SendbirdUIKit

struct Message: View {
    init() {
        SBUGlobals.currentUser = SBUUser(userId: "Test")
        SendbirdUI.connect { (user, error) in
            guard user != nil else {
                print("Sendbird Init: Connection Error \(String(describing: error))")
                return
            }
        }
    }
    var body: some View {
        ChannelListViewContainer()
    }
}

class ChannelListViewController: SBUGroupChannelListViewController {
    override func viewDidLoad() {
        let customChannelListTheme = SBUGroupChannelListTheme()
        customChannelListTheme.navigationBarTintColor = UIColor(Color.customMint)
        SBUTheme.set(theme: SBUTheme(groupChannelListTheme: customChannelListTheme))
        self.headerComponent?.leftBarButton?.isHidden = true
        self.headerComponent?.rightBarButton?.isHidden = true
        self.headerComponent?.titleView = createCustomTitleLabel()
    }
    
    func createCustomTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = "메세지"
        titleLabel.textColor = UIColor(Color.white)
        titleLabel.font = .boldSystemFont(ofSize: 20)
        return titleLabel
    }
}

struct ChannelListViewContainer: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController
    
    func makeUIViewController(context: Context) -> UINavigationController {
        return UINavigationController(rootViewController: ChannelListViewController())
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) { }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
