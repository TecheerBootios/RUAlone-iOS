//
//  FeedView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/11.
//

import SwiftUI

struct FeedView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(0..<100) { _ in
                                FeedRowView(title: "버거킹 같이먹어요.", date: "2022/11/30", gathered: 3, hours: 2)
                                    .padding([.top, .leading, .trailing])
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .background(Color.customWhite)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .navigationTitle("메이트 구하기")
            .navigationBarColor(titleColor: .white)
            .background(Color.customPink)
        }
        .textFieldColor(backgroundColor: .white, tintColor: .black)
        .searchable(text: $searchText,
                    prompt: Text("메뉴를 검색해보세요").foregroundColor(.white)) {
            SuggestionView()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
