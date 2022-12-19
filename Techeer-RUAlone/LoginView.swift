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
                        .frame(width: 250, height: 270)
                    
                    Text("로그인")
                        .font(.system(size:35, weight: .black))
                    
                    HStack {
                        Image("Email")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                        TextField("이메일", text: $email)
                    }
                    .background(Color(uiColor: .white))
                    .cornerRadius(50)
                    .padding(10)
                    
                    HStack {
                        Image("Password")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                        TextField("패스워드", text: $password)
                    }
                    .background(Color(uiColor: .white))
                    .cornerRadius(50)
                    .padding(10)
                    
                    Button("로그인") { }
                        .frame(width: 330, height: 25)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.customWhite)
                        .cornerRadius(50)
                        .padding(10)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    
                    Button("카카오 로그인") { }
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
