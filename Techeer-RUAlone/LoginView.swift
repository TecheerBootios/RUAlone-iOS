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
        Text("이메일 \(emailAddress)")
        TextField("이메일", text: $emailAddress)
          .padding()
          .background(Color(uiColor: .secondarySystemBackground))
          .textFieldStyle(.roundedBorder)
        Text("패스워드 \(password)")
        TextField("패스워드", text: $password)
          .padding()
          .background(Color(uiColor: .secondarySystemBackground))
          .textFieldStyle(.roundedBorder)
      }
    }
  }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
