//
//  FeedFormView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import SwiftUI

struct FeedForm: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private(set) var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    titleLocationSection()
                    gatheringSection()
                    dateSelectionSection()
                }
                .scrollContentBackground(.hidden)
                .listStyle(.sidebar)
                Spacer()
                Button(action: {
                    viewModel.submitFeedForm()
                    dismiss()
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
            .headerProminence(.increased)
            .navigationTitle("새로운 모임 만들기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("닫기")
                }
            }
        }.onAppear {
            viewModel.updateUserLocation()
        }
    }
}

extension FeedForm {
    private func titleLocationSection() -> some View {
        Section("Form Title") {
            formTitleTextFieldView()
            NavigationLink(destination: {
                PointOfInterestView(viewModel: viewModel)
            }, label: {
                Text("Location")
            })
        }
    }
    
    private func formTitleTextFieldView() -> some View {
        TextField("Field Example",
                  text: $viewModel.form.title)
        .autocorrectionDisabled()
        .textFieldStyle(.automatic)
    }
    
    private func postTypeSelection() -> some View {
        Picker("", selection: $viewModel.form.postType) {
            ForEach(FormModel.PostType.allCases, id: \.self) {
                Text($0.description)
            }
        }.pickerStyle(.segmented)
    }
    
    private func limitMemberSection() -> some View {
        Picker("", selection: $viewModel.form.limitMember) {
            ForEach(1...5, id: \.self) {
                Text("Person \($0)")
            }
        }.pickerStyle(.segmented)
    }
    
    private func gatheringSection() -> some View {
        Section {
            foodCategorySection()
            postTypeSelection()
            limitMemberSection()
        } header: {
            Text("Post Settings")
        }
    }
    
    private func foodCategorySection() -> some View {
        Picker("Food Category", selection: $viewModel.form.foodCategory) {
            ForEach(FormModel.FoodCategory.allCases, id: \.self) { category in
                Text(category.description)
            }
        }
    }
    
    private func detailSection() -> some View {
        Picker("배달? 픽업?", selection: $viewModel.form.foodCategory) {
            Text("배달")
            Text("픽업")
        }
    }
    
    private func dateSelectionSection() -> some View {
        Section("Date") {
            DatePicker("Date Ask", selection: $viewModel.form.startAt)
                .datePickerStyle(.automatic)
        }
    }
}

struct PointOfInterestView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: FeedForm.ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("음식점 검색", text: $viewModel.pointOfInterest)
            Divider()
            List(viewModel.mapItem) { item in
                Button(action: {
                    viewModel.selectedMapItem = item
                    dismiss()
                }, label: {
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.address)
                            .foregroundColor(.secondary)
                    }
                })
            }.listStyle(.plain)
        }
        .navigationTitle("음식점을 찾아보세요")
        .padding(.all)
    }
}

struct FeedFormView_Previews: PreviewProvider {
    static var previews: some View {
        FeedForm(viewModel: .init(form: FormModel()))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
