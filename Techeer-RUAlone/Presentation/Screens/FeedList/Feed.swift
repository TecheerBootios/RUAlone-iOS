//
//  FeedView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/11.
//

import SwiftUI

struct Feed: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customPink.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(FeedModel.stubs(), id: \.self) {
                        DetailRowView(feed: $0)
                            .padding([.top, .leading, .trailing])
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.customWhite)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationTitle("Find Nav Title")
            .navigationBarColor(titleColor: .white)
            .textFieldColor(backgroundColor: .white, tintColor: .black)
            .searchable(text: $searchText, prompt: Text("메뉴를 검색해보세요"))
            .toolbar {
                NavigationLink(destination: {
                    FeedForm(viewModel: .init(form: FormModel()))
                }, label: { Image(systemName: "plus")})
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
