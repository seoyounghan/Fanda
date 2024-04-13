//
//  Calendar.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentDate = Date()

    var body: some View {
        
        VStack(spacing: 20) {
            
            CustomDatePicker(currentDate: $currentDate)
        }
    }
}

#Preview {
    CalendarView()
}
