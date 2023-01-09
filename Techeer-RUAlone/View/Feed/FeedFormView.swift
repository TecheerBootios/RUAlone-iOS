//
//  FeedFormView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/09.
//

import SwiftUI

enum FoodCategory: String, CaseIterable, Identifiable {
    case 한식, 중식, 일식, 치킨, 분식, 양식
    var id: Self { self }
}

struct FeedFormView: View {
    @State private var selectionFoodCategory: FoodCategory = .한식
    @State private var startAt = Date()
    @State private var numberOfMembers = 0
    @State private var title = ""
    var body: some View {
        List {
            TextField("제목", text: $title).autocorrectionDisabled().textFieldStyle(.automatic)
            Picker("무슨 종류의 음식인가요?", selection: $selectionFoodCategory) {
                ForEach(FoodCategory.allCases) { category in
                    Text(category.rawValue)
                }
            }
            DatePicker("언제 만날까요?", selection: $startAt, displayedComponents: .hourAndMinute)
            Picker("모집인원은 몇명인가요?", selection: $numberOfMembers) {
                ForEach(1...10, id: \.self) {
                    Text("\($0)명")
                }
            }
        }
    }
}

struct FeedFormView_Previews: PreviewProvider {
    static var previews: some View {
        FeedFormView()
    }
}
