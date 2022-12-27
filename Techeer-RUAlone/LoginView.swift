//
//  LoginView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        Color.customBackground
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Image("MainIcon")
                        .resizable()
                        .frame(width: 320, height: 340)
                    
                    Button("카카오 로그인") {}
                        .frame(width: 330, height: 25)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.customYellow)
                        .cornerRadius(50)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
