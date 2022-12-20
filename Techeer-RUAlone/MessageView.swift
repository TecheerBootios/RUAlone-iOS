//
//  MessageView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI

struct MessageView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    @State private var searchText = ""
    @State private var isPresented = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(0..<100) { _ in
                                MesseageRowView(title: "우육탕면 팟", time: "4:30 PM", chat: "그때 만나요!")
                                    .padding([.top, .leading, .trailing]).onTapGesture {
                                        isPresented = true
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .searchable(text: $searchText,
                                    prompt: Text("검색...").foregroundColor(.white)) {
                            SuggestionView()
                        }
                    }
                }
                .background(Color.customWhite)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .sheet(isPresented: $isPresented) {
                    Text("Details")
                }
            }
            .navigationTitle("메세지")
            .navigationBarColor(titleColor: .white)
            .background(Color.customMint)
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
