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
                    Section(header: Text("Form Title")) {
                        TextField("Field Example",
                                  text: $formViewModel.form.title)
                            .autocorrectionDisabled()
                            .textFieldStyle(.automatic)
                        NavigationLink(destination: {
                            LocationSelectionView(searchViewModel: searchViewModel,
                                                  formViewModel: formViewModel)
                        }, label: {
                            Text("Location")
                        })
                    }
                    
                    Section("Persons") {
                        Picker("", selection: $formViewModel.form.numberOfMember) {
                            ForEach(1...5, id: \.self) {
                                Text("Person \($0)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    
                    Section("Food Category") {
                        Picker("Food Type", selection: $formViewModel.form.foodCategory) {
                            ForEach(FoodCategory.allCases, id: \.self) { category in
                                Text(category.description)
                            }
                        }
                    }
                    
                    Section("Date") {
                        DatePicker("Date Ask", selection: $formViewModel.form.startAt)
                    }
                }
                Spacer()
                Button(action: {
                    print("\(formViewModel.form)")
                }, label: {
                    HStack {
                        Spacer()
                        Text("Submit")
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
