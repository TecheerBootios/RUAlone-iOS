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
    @State var sampleAnalytics: [ActivityStat] = ActivityStat.stub()
    
    @State var didChange: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Activity")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                Chart {
                    ForEach(sampleAnalytics, id: \.self) { activity in
                        BarMark(x: .value("Meeting", activity.month),
                                y: .value("Total Count", activity.base))
                        .foregroundStyle(.blue)
                        .annotation {
                            Text("\(activity.count)").font(.caption).fontWeight(.regular).foregroundColor(.white)
                        }
                    }
                }
                .chartYScale(domain: 0...((ActivityStat.stub().max { item1, item2 in
                    return item2.count > item1.count
                }?.count ?? 0)+5))
                .chartYAxis(.hidden)
            }
            .padding()
            .padding(.bottom)
            .onAppear {
                didChange.toggle()
                animateChart(fromChange: didChange)
            }
        }
    }
    
    func animateChart(fromChange: Bool = false) {
        for (index, _) in sampleAnalytics.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.04 : 0.06)) {
                withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.4, blendDuration: 0.4)) {
                    sampleAnalytics[index].animate = true
                    while sampleAnalytics[index].base < sampleAnalytics[index].count {
                        sampleAnalytics[index].base += 1
                    }
                }
            }
        }
        for (index, _) in sampleAnalytics.enumerated() {
            sampleAnalytics[index].base = 0
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
                PieChartView(values: SpendingStat.stub().values,
                             names: SpendingStat.stub().category,
                             formatter: {value in String(format: "₩%.0f", value)},
                             colors: SpendingStat.stub().colors)
                .cornerRadius(20, corners: .allCorners)
            }
            .padding()
            .padding(.bottom)
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
