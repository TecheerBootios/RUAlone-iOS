//
//  SignupView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI

struct SignupView: View {
    @State var user: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        Color.customBackground
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Image("MainIcon")
                        .resizable()
                        .frame(width: 200, height: 220)
                    
                    Text("회원가입")
                        .font(.system(size:35, weight: .black))
                    
                    HStack {
                        Image("User")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(15)
                        TextField("사용자 이름", text: $email)
                    }
                    .frame(width: 360, height: 60)
                    .background(Color(uiColor: .white))
                    .cornerRadius(50)
                    
                    HStack {
                        Image("Email")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                        TextField("이메일", text: $email)
                    }
                    .frame(width: 360, height: 60)
                    .background(Color(uiColor: .white))
                    .cornerRadius(50)
                    .padding(5)
                    
                    HStack {
                        Image("Password")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(20)
                        TextField("패스워드", text: $password)
                    }
                    .frame(width: 360, height: 60)
                    .background(Color(uiColor: .white))
                    .cornerRadius(50)
                    .padding(5)
                    
                    Button("회원 가입") { }
                        .frame(width: 330, height: 25)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(50)
                        .padding(5)
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
