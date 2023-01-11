//
//  FeedView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/11.
//

import SwiftUI

struct FeedView: View {
    init() { UITabBar.appearance().backgroundColor = UIColor.white }
    @State private var searchText = ""
    private let example = ExampleFeedModel()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(example.feeds, id: \.self) { feed in
                                FeedRowView(feed: feed)
                                    .padding([.top, .leading, .trailing])
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .background(Color.customWhite)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .navigationTitle("Find Nav Title")
            .navigationBarColor(titleColor: .white)
            .background(Color.customPink)
            .toolbar {
                NavigationLink(destination: { FeedFormView() }, label: { Image(systemName: "plus")})
            }
        }
        .searchable(text: $searchText, prompt: Text("메뉴를 검색해보세요"))
        .textFieldColor(backgroundColor: .white, tintColor: .black)
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
