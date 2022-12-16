//
//  ContentView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/11/30.
//

import SwiftUI

struct LoginView: View {
    @State var emailAddress: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Image("icon")
                .resizable()
                .frame(width: 300, height: 300, alignment: .leading)
            
            Text("로그인")
                .font(.system(size: 40))
                .fontWeight(.bold)
            
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
            
            .padding(5)
            
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
            .padding(5)
            
            Button(action: {}) {
                Text("로그인")
                    .fontWeight(.bold)
                    .frame(maxWidth: 300)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
            .padding(5)
            
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
            .padding(5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .accentColor(Color.black)
        .background(ColorManager.BackgroundColor.ignoresSafeArea())
    }
}

struct ColorManager {
    static let BackgroundColor = Color("myBackground")
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
