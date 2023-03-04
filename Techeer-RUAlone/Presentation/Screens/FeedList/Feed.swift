//
//  FeedView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/11.
//

import SwiftUI

struct Feed: View {
    @State private var searchText = ""
    @State private var isPresented = false
    @StateObject private var viewModel: ViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customWhite.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(Array(zip(viewModel.feeds.indices, viewModel.feeds)), id: \.0) { index, item in
                        DetailRowView(feed: item, index: index)
                            .padding([.top, .leading, .trailing])
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.customWhite)
                .refreshable {
                    viewModel.fetchPosts()
                }
            }
            .navigationTitle("Find Nav Title")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: Text("메뉴를 검색해보세요"))
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus").foregroundColor(.customPink).bold()
                }
            }
            .fullScreenCover(isPresented: $isPresented) {
                FeedForm(viewModel: .init(form: FormModel()))
            }
        }
        .onAppear {
            viewModel.requestUsageAuthorization()
            viewModel.fetchPostsWithDistance()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
