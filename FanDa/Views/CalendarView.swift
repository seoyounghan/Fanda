//
//  Calendar.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    @State private var currentDate = Date()
    @State var activeNum = 0
    
    @Environment(\.modelContext) var modelContext
    @Query private var qur: [UserData]
    @Query private var matchRecord: [UserMatchRecord]
    
    var todayWritten: [UserMatchRecord] {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return matchRecord.filter({dateFormatter.string(from: $0.matchDate) == dateFormatter.string(from: Date())})
    }
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TopBarView(activeNum: $activeNum)
                
                
                
                if activeNum == 0 {
                    if todayWritten.count > 0 {
                        if todayWritten[0].matchOutcome == .win {
                            CustomDatePicker(currentDate: $currentDate, winLoseClicked: 1)
                        } else if todayWritten[0].matchOutcome == .lose {
                            CustomDatePicker(currentDate: $currentDate, winLoseClicked: 2)
                        } else {
                            CustomDatePicker(currentDate: $currentDate, winLoseClicked: 0)
                        }
                    } else {
                        CustomDatePicker(currentDate: $currentDate, winLoseClicked: 0)
                    }
                } else {
                    
                    DiaryListView()
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    CalendarView()
}
