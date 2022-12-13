//
//  ContentView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

struct SignupView: View {
    @State var username: String = ""
    @State var emailAddress: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Image("icon")
                .resizable()
                .frame(width: 300, height: 300, alignment: .leading)
            
            Text("회원가입")
                .font(.system(size: 40))
                .fontWeight(.bold)
            
            HStack {
                Image("user")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                TextField("사용자 이름", text: $username)
            }
                    .frame(maxWidth: 300)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            
            HStack {
                Image("email")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                TextField("이메일", text: $emailAddress)
            }
                    .frame(maxWidth: 300)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            
            HStack {
                Image("password")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                TextField("패스워드", text: $password)
            }
                .frame(maxWidth: 300)
                .padding()
                .foregroundColor(.black)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Button(action: {}) {
                Text("회원 가입")
                    .fontWeight(.bold)
                    .frame(maxWidth: 300)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
            
            Button(action: {}) {
                Text("카카오 로그인")
                    .fontWeight(.bold)
                    .frame(maxWidth: 300)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .accentColor(Color.black)
        .background(SignupColor.BackgroundColor.ignoresSafeArea())
    }
}

struct SignupColor {
    static let BackgroundColor = Color("myBackground")
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
