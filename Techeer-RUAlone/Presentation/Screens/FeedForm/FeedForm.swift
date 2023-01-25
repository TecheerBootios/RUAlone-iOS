//
//  FeedFormView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import SwiftUI

struct FeedForm: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customOrange.ignoresSafeArea()
                VStack {
                    List {
                        titleLocationSection()
                        Section {
                            foodCategorySection()
                            postTypeSelection()
                            limitMemberSection()
                        } header: {
                            Text("Post Settings")
                        }
                        dateSelectionSection()
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.sidebar)
                    Spacer()
                    Button(action: {
                        print("\($viewModel)")
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Submit").font(.title2).bold()
                                .padding([.top, .bottom])
                            Spacer()
                        }
                    })
                    .padding([.leading, .trailing])
                    .buttonStyle(.borderedProminent)
                }
            }
            .headerProminence(.increased)
            .navigationTitle("새로운 글 작성")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }.onAppear {
            viewModel.updateUserLocation()
        }
    }
}

extension FeedForm {
    private func titleLocationSection() -> some View {
        Section(header: Text("Form Title")) {
            formTitleTextFieldView()
            NavigationLink(destination: {
                pointOfInterestSelectionView()
            }, label: {
                Text("Location")
            })
        }
    }
    
    private func formTitleTextFieldView() -> some View {
        TextField("Field Example",
                  text: $viewModel.title)
            .autocorrectionDisabled()
            .textFieldStyle(.automatic)
    }
    
    private func pointOfInterestSelectionView() -> some View {
        VStack(alignment: .leading) {
            TextField("음식점 검색", text: $viewModel.pointOfInterest)
            Divider()
            List(viewModel.data) { item in
                Button(action: { }, label: {
                    VStack(alignment: .leading) {
                        Text(item.locationTitle)
                        Text(item.locationAddress)
                            .foregroundColor(.secondary)
                    }
                })
            }
        }
        .navigationTitle("음식점을 찾아보세요")
        .padding(.all)
    }
    
    private func postTypeSelection() -> some View {
        Picker("", selection: $viewModel.postType) {
            ForEach(FormModel.PostType.allCases, id: \.self) {
                Text($0.description)
            }
        }.pickerStyle(.segmented)
    }
    
    private func limitMemberSection() -> some View {
        Picker("", selection: $viewModel.limitMember) {
            ForEach(1...5, id: \.self) {
                Text("Person \($0)")
            }
        }.pickerStyle(.segmented)
    }
    
    private func foodCategorySection() -> some View {
        Picker("Food Category", selection: $viewModel.foodCategory) {
            ForEach(FormModel.FoodCategory.allCases, id: \.self) { category in
                Text(category.description)
            }
        }
    }
    
    private func dateSelectionSection() -> some View {
        Section("Date") {
            DatePicker("Date Ask", selection: $viewModel.startAt)
                .datePickerStyle(.graphical)
        }
    }
}

struct FeedFormView_Previews: PreviewProvider {
    static var previews: some View {
        FeedForm(viewModel: .init(form: FormModel()))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
