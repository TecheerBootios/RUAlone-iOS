//
//  MessageView.swift
//  Techeer-RUAlone
//
//  Created by 정혜린 on 2022/12/20.
//

import SwiftUI

struct Message: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    @State private var searchText = ""
    @State private var isPresented = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    ScrollView(.vertical) {
                        HStack {
                            Button("채팅") { }
                                .frame(width: 100, height: 15)
                                .foregroundColor(Color.black)
                                .padding()
                                .background(Color.customWhite)
                                .cornerRadius(50)
                                .padding(10)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                            Button("기록") { }
                                .frame(width: 100, height: 15)
                                .foregroundColor(Color.black)
                                .padding()
                                .background(Color.customWhite)
                                .cornerRadius(50)
                                .padding(10)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        
                        LazyVStack {
                            ForEach(0..<100) { _ in
                                DetailRowView(feed: FeedModel(title: "", date: Date(), currentlyGathered: 0, hoursPassed: 0))
                                    .padding([.top, .leading, .trailing]).onTapGesture {
                                        isPresented = true
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity)
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
        .textFieldColor(backgroundColor: .white, tintColor: .black)
        .searchable(text: $searchText,
                    prompt: Text("메뉴를 검색해보세요").foregroundColor(.white)) { }
    }
}
    
    struct MessageView_Previews: PreviewProvider {
        static var previews: some View {
            Message()
        }
    }
