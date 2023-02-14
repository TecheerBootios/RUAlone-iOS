//
//  StatChart.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/13.
//

import SwiftUI
import Charts
import SwiftPieChart

struct GatherChart: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Activity")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                Chart {
                    ForEach(ActivityStat.stub(), id: \.self) { activity in
                        BarMark(x: .value("Meeting", activity.month),
                                y: .value("Total Count", activity.count))
                        .foregroundStyle(.blue)
                    }
                }
            }
            .padding()
            .padding(.bottom)
        }
    }
}

struct MoneyChart: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Book Keeping")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                PieChartView(values: [20000, 32800, 59000, 19800, 40000, 108000],
                             names: ["중식", "한식", "분식", "치킨", "양식", "일식"],
                             formatter: {value in String(format: "₩%.0f", value)},
                             colors: [.blue, .green, .orange, .yellow, .brown, .indigo])
                .cornerRadius(20, corners: .allCorners)
            }
            .padding([.top, .trailing, .leading])
        }
    }
}

struct TimeChart: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Time Spent")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                Chart(FoodStat.stub(), id: \.self) { data in
                    BarMark(x: .value("Time", data.date), y: .value("Minutes", data.minutes))
                        .foregroundStyle(by: .value("Category", data.category.rawValue))
                }
                
            }
            .padding()
            .padding(.bottom)
        }
    }
}


struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GatherChart()
        MoneyChart()
        TimeChart()
    }
}
