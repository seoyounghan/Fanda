//
//  CustomDatePicker.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    var body: some View {
        VStack{
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 20){
                
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
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    Text("\(value.day)")
                        .font(.title3)
                }
            }
        }
        .onChange(of: currentMonth) { newValue in
            //달 갱신
            currentDate = getCurrentMonth()
        }
    }
    // 달 년 갱신
    func extraData() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
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
        
        return currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
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
        
        var range = calendar.range(of: .day, in: .month, for: startDate)!
        range.removeLast()
        
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day == 1 ? 0 : day, to: startDate)!
            
        }
    }
}
