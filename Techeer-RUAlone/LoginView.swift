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
            Text("로그인")
                .font(.system(size: 30))
            
            TextField("이메일", text: $emailAddress)
                .frame(maxWidth: 300)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            TextField("패스워드", text: $password)
                .frame(maxWidth: 300)
                .padding()
                .foregroundColor(.black)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
