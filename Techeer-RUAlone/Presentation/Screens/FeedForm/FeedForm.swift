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
                VStack {
                    List {
                        titleLocationSection()
                        dateSelectionSection()
                        limitMemeberSection()
                        foodCategorySection()
                    }
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
            .listStyle(.insetGrouped)
            .headerProminence(.increased)
            .navigationTitle("새로운 글 작성")
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
    
    private func limitMemeberSection() -> some View {
        Section("Persons") {
            Picker("", selection: $viewModel.limitMember) {
                ForEach(1...5, id: \.self) {
                    Text("Person \($0)")
                }
            }.pickerStyle(.segmented)
        }
    }
    
    private func foodCategorySection() -> some View {
        Section("Food Category") {
            Picker("Food Type", selection: $viewModel.foodCategory) {
                ForEach(Form.FoodCategory.allCases, id: \.self) { category in
                    Text(category.description)
                }
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
        FeedForm(viewModel: .init(form: Form()))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
