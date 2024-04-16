//
//  SelectView.swift
//  FanDa
//
//  Created by hanseoyoung on 4/16/24.
//

import SwiftUI
import SwiftData

struct SelectView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var qur: [UserData]
    @State private var buttonTapped: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Fanda")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image("appIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 50)
                if qur.isEmpty {
                    
                    
                    Button(action: {
                        buttonTapped = true
                    }, label: {
                        Text("나의 팀 설정")
                            .font(.title)
                            
                            .frame(width: 300, height: 50)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            
                    })
                    .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.blue)
                            )
                            .padding([.top, .horizontal])
                    .navigationDestination(isPresented: $buttonTapped) {
                        SelectTeam()
                    
                    }
                } else {
                    Button(action: {
                        buttonTapped = true
                    }, label: {
                        Text("다이어리 작성")
                    })
                    .navigationDestination(isPresented: $buttonTapped) {
                        CalendarView()
                    }
                }
            }
        }
    }
}

#Preview {
    SelectView()
}
