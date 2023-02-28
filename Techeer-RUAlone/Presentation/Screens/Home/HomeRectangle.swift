//
//  HomeRectangle.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/13.
//

import SwiftUI
import FSCalendar

struct HomeRectangle: View {
    let rectangleColor: Color
    
    private let radius: CGFloat = 20
    private let shadowRadius: CGFloat = 10
    private let shadowArea: CGFloat = 5
    @State var isEventDate: Bool = false
    @State var isChatPresented: Bool = false
    @State var selectedDate: Date = Date()
    @ObservedObject var viewModel: Home.ViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .fill(rectangleColor)
                    .overlay {
                        VStack {
                            Text(viewModel.header)
                                .font(.title)
                                .bold()
                            
                            CalendarView(isSelectedEventDate: $isEventDate, selectedDate: $viewModel.selectedDate, eventDates: $viewModel.dates)
                        }
                        .padding()
                        .sheet(isPresented: $isEventDate) {
                            VStack {
                                Text("\(selectedDate.formatted(date: .abbreviated, time: .omitted))은 모임이 있는 날 입니다!")
                                Button(action: {
                                    isChatPresented.toggle()
                                    viewModel.fetchChatURL()
                                }, label: {
                                    Text("채팅방 바로 들어가기")
                                        .font(.title3)
                                })
                                .tint(.customOrange)
                                .buttonStyle(.borderedProminent)
                                .fullScreenCover(isPresented: $isChatPresented) {
                                    ChatView(channelURL: viewModel.chatURL)
                                }
                            }
                            .presentationDetents([.height(geometry.size.height/3)])
                        }
                    }
                    .shadow(radius: 20)
            }
        }
    }
    
    struct CalendarView: View {
        @Binding var isSelectedEventDate: Bool
        @Binding var selectedDate: Date
        @Binding var eventDates: [Date]
        
        var body: some View {
            CalendarViewRepresentable(selectedDate: $selectedDate, isSelectedEventDate: $isSelectedEventDate, eventDates: $eventDates)
                .ignoresSafeArea()
        }
    }
    
    struct CalendarViewRepresentable: UIViewRepresentable {
        typealias UIViewType = FSCalendar
        
        fileprivate var calendar = FSCalendar()
        @Binding var selectedDate: Date
        @Binding var isSelectedEventDate: Bool
        @Binding var eventDates: [Date]
        
        func makeUIView(context: Context) -> FSCalendar {
            calendar.delegate = context.coordinator
            calendar.dataSource = context.coordinator
            calendar.appearance.todayColor = UIColor(displayP3Red: 0,
                                                     green: 0,
                                                     blue: 0, alpha: 0)
            calendar.appearance.titleTodayColor = .black
            calendar.appearance.selectionColor = .orange
            calendar.appearance.eventDefaultColor = .red
            calendar.appearance.titleTodayColor = .blue
            calendar.appearance.titleFont = .boldSystemFont(ofSize: 20)
            calendar.appearance.titleWeekendColor = .systemOrange
            calendar.appearance.headerMinimumDissolvedAlpha = 0.12
            calendar.appearance.headerTitleFont = .systemFont(
                ofSize: 20,
                weight: .black)
            calendar.appearance.headerTitleColor = .darkGray
            calendar.appearance.headerDateFormat = "MMMM"
            calendar.scrollDirection = .vertical
            calendar.scope = .month
            calendar.clipsToBounds = true
            
            return calendar
        }
        
        func updateUIView(_ uiView: FSCalendar, context: Context) {}
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
            var parent: CalendarViewRepresentable
            
            init(_ parent: CalendarViewRepresentable) {
                self.parent = parent
            }
            
            func calendar(_ calendar: FSCalendar,
                          didSelect date: Date,
                          at monthPosition: FSCalendarMonthPosition) {
                parent.selectedDate = date
                
                if isEventDate(parent.eventDates, date)  {
                    parent.isSelectedEventDate.toggle()
                }
            }
            
            func calendar(_ calendar: FSCalendar,
                          numberOfEventsFor date: Date) -> Int {
                let eventDates = parent.eventDates
                var eventCount = 0
                eventDates.forEach { eventDate in
                    if eventDate.formatted(date: .complete,
                                           time: .omitted) == date.formatted(
                                            date: .complete, time: .omitted){
                        eventCount += 1;
                    }
                }
                return eventCount
            }
            
            func isEventDate(_ eventDate: [Date], _ selectedDate: Date) -> Bool {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                dateFormatter.timeStyle = .none
                return eventDate.map { dateFormatter.string(from: $0) }
                    .contains(dateFormatter.string(from: selectedDate))
            }
            
            func maximumDate(for calendar: FSCalendar) -> Date {
                Date.now.addingTimeInterval(86400 * 30)
            }
            
            func minimumDate(for calendar: FSCalendar) -> Date {
                Date.now.addingTimeInterval(-86400 * 30)
            }
        }
    }
}


struct HomeRectangle_Previews: PreviewProvider {
    static var previews: some View {
        HomeRectangle(rectangleColor: .customPurple, viewModel: .init())
    }
}
