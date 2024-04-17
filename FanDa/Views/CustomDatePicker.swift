//
//  CustomDatePicker.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import SwiftUI
import SwiftData

struct CustomDatePicker: View {
    @Environment(\.modelContext) var modelContext
    @Query private var qur: [UserData]
    @Query private var matchRecord: [UserMatchRecord]
    
    var todayWritten: [UserMatchRecord] {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return matchRecord.filter({dateFormatter.string(from: $0.matchDate) == dateFormatter.string(from: Date())})
    }
    
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    @State private var tag: Bool = false
    @State var winLoseClicked: Int
    @State var showModal: Bool = false
    @State var detailModal: Bool = false
    @State var matchUUID: UUID = UUID()
    @State var isWritten: Bool = false
    
    
    let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"] 
    
    var body: some View {
        VStack {
            
            VStack(alignment: .center) {
                Image("\(qur[0].favoriteTeam.imageName)")
                // 프리뷰용 사진
                //Image("image3")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .frame(height: 50)
                    .padding(.all, 10)
                
                Divider()
                    .background(.gray)
                
                Text("오늘의 승패")
                    .fontWeight(.bold)
                    .font(.subheadline)
                HStack {
                    Button(action: {
                        winLoseClicked = 1
                    }, label: {
                        Text("승")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(width: 30, height: 30)
                            .padding(.all, 10)
                        
                        
                    })
                    .foregroundColor(.white)
                    .background(clikedColor(num1: winLoseClicked, num2: 1))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        winLoseClicked = 2
                    }, label: {
                        Text("패")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(width: 30, height: 30)
                            .padding(.all, 10)
                        
                    })
                    .foregroundColor(.white)
                    .background(clikedColor(num1: winLoseClicked, num2: 2))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                }
                Button(action: {
                    self.showModal = true
                }, label: {
                    Text("오늘의 경기 기록하기")
                        .frame(width: 280, height: 44)
                })
                .foregroundColor(.black)
                .background(Color(red: 0, green: 122/255, blue: 255/255, opacity: 0.47))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .padding()
                .sheet(isPresented: self.$showModal, content: {
                    if todayWritten.count > 0 {
                        InputModalView(matchTeam: todayWritten[0].matchOpponent.name, detailWritten: todayWritten[0].detail, pogWritten: todayWritten[0].pog, setWritten: todayWritten[0].matchSet, emojiWritten: todayWritten[0].todayEmoji, winLoseClicked: $winLoseClicked, showModal: $showModal)
                    } else {
                        InputModalView(matchTeam: "팀을 골라주세요", detailWritten: "", pogWritten: "선수를 선택해주세요", setWritten: "", emojiWritten: "", winLoseClicked: $winLoseClicked, showModal: $showModal)
                    }
                })
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray)
            )
            .padding([.top, .horizontal])
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(extraData()[0])")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("\(extraData()[1])")
                        .font(.title.bold())
                    
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) {day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //Dates
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(extractDate()) { value in
                    //                    Text("\(value.day)")
                    //                        .font(.title3)
                    
                    CardView(value: value)
                        .background(
                            
                            Capsule()
                                .fill(Color(red: 0, green: 122/255, blue: 255/255, opacity: 0.47))
                                .padding(.horizontal, 5)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1: 0)
                            
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .onChange(of: currentMonth) { newValue in
            //달 갱신
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let match = matchRecord.first(where: { match in
                    
                    return isSameDay(date1: match.matchDate, date2: value.date)
                }){
                    Button(action: {
                        currentDate = getCurrentMonth()
                        matchUUID = match.id
                        detailModal.toggle()
                    }, label: {
                        VStack {
                            Text("\(value.day)")
                                .font(.title3)
                                .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                                .frame(maxWidth:.infinity)
                            
                            Spacer()
                            if match.matchOutcome == matchRecordType.win {
                                Circle()
                                    .fill(.blue)
                                    .frame(width: 8, height: 8)
                                
                            } else {
                                Circle()
                                    .fill(.gray)
                                    .frame(width: 8,height: 8)
                            }
                        }
                    })
                    .sheet(isPresented: $detailModal, content: {
                        DetailModalView(showModal: $detailModal, detailUUID: $matchUUID)
                    })
                    
                    
                } else {
                    Text("\(value.day)")
                        .font(.title3)
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth:.infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 10)
        .frame(height: 55, alignment: .top)
    }
    
//    private func isTodayWritten() {
//        if todayWritten.count > 0 {
//            if todayWritten[0].matchOutcome == .lose {
//                self.winLoseClicked = 1
//            } else if todayWritten[1].matchOutcome == .win {
//                self.winLoseClicked = 2
//            } else {
//                self.winLoseClicked = 0
//            }
//        } else {
//            winLoseClicked = 0
//        }
//    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    // 달 년 갱신
    func extraData() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        // 현재 달, 일 받아오기
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
        
    }
    
    func clikedColor(num1: Int, num2: Int) -> Color {
        if num1 == num2 {
            return Color.blue
        } else {
            return Color.gray
        }
    }
}

struct CustomDatePicker_Preview: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            
        }
    }
}

#Preview {
    CalendarView()
}
