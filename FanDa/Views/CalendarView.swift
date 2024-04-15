//
//  Calendar.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentDate = Date()
    @State var activeNum = 0
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TopBarView(activeNum: $activeNum)
                
                if activeNum == 0 {
                    CustomDatePicker(currentDate: $currentDate)
                } else {
                    DiaryListView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    CalendarView()
}
