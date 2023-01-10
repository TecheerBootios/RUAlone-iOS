//
//  FeedFormView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import SwiftUI

struct FeedFormView: View {
    @ObservedObject var formViewModel = FeedFormViewModel()
    @ObservedObject var searchViewModel = LocalSearchViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("제목")) {
                        TextField("예) 버거킹 같이 드실 분!",
                                  text: $formViewModel.form.title)
                            .autocorrectionDisabled()
                            .textFieldStyle(.automatic)
                        NavigationLink(destination: {
                            LocationSelectionView(searchViewModel: searchViewModel,
                                                  formViewModel: formViewModel)
                        }, label: {
                            Text("모임 위치")
                        })
                    }
                    
                    Section("모집 인원") {
                        Picker("", selection: $formViewModel.form.numberOfMember) {
                            ForEach(1...5, id: \.self) {
                                Text("\($0)명")
                            }
                        }.pickerStyle(.segmented)
                    }
                    
                    Section("음식 카테고리") {
                        Picker("음식 종류", selection: $formViewModel.form.foodCategory) {
                            ForEach(FoodCategory.allCases, id: \.self) { category in
                                Text(category.rawValue)
                            }
                        }
                    }
                    
                    Section("일정") {
                        DatePicker("언제 만날까요?", selection: $formViewModel.form.startAt)
                    }
                }
                Spacer()
                Button(action: {
                    print("\(formViewModel.form)")
                }, label: {
                    HStack {
                        Spacer()
                        Text("작성 완료")
                            .font(.title2)
                            .bold()
                            .padding(.all)
                        Spacer()
                    }
                })
                .padding([.leading, .trailing])
                .buttonStyle(.borderedProminent)
            }
            .listStyle(.insetGrouped)
            .headerProminence(.increased)
            .navigationTitle("새로운 글 작성")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
        
    }
}

struct FeedFormView_Previews: PreviewProvider {
    static var previews: some View {
        FeedFormView()
    }
}
