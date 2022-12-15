//
//  View+Extension.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/15.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    var titleColor: UIColor?

    init(titleColor: UIColor?) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                Spacer()
            }
        }
    }
}

struct TextFieldModifier: ViewModifier {
    var backgroundColor: UIColor?
    var tintColor: UIColor?
    
    init(backgroundColor: UIColor?, tintColor: UIColor?) {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = backgroundColor ?? .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = tintColor ?? .black
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                Spacer()
            }
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func navigationBarColor(titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(titleColor: titleColor))
    }

    func textFieldColor(backgroundColor: UIColor?, tintColor: UIColor?) -> some View {
        self.modifier(TextFieldModifier(backgroundColor: backgroundColor, tintColor: tintColor))
    }
}
