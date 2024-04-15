//
//  topBarView.swift
//  FanDa
//
//  Created by hanseoyoung on 4/14/24.
//

import SwiftUI

struct TopBarView: View {
    @State private var selectedNum: Int = 0
    @Binding var activeNum: Int
    
        var body: some View {
        HStack {
            Button(action: 
                    {
                selectedNum = 0
                activeNum = 0 }, label: {
                VStack {
                    if selectedNum == 0 {
                        Text("오늘의 승패")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            
                        Divider()
                            .frame(width: 113, height: 5)
                            .background(Color.blue)
                  
                            
                    } else {
                        Text("오늘의 승패")
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                        Divider()
                            .frame(width: 113, height: 1)
                            .background(Color.gray)
                            
                        
                    }
                }
            })
            Spacer()
                .frame(width: 50)
            
            Button(action: {
                selectedNum = 1
                activeNum = 1}, label: {
                VStack {
                    if selectedNum == 1 {
                        Text("지난 기록 보기")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                        Divider()
                            .frame(width: 113, height: 5)
                            .background(Color.blue)
                            
                        
                    } else {
                        Text("지난 기록 보기")
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                        
                        Divider()
                            .frame(width: 113, height: 1)
                            .background(Color.gray)
                            
                    }
                }
            })
        }
    }
}

//#Preview {
//    //topBarView()
//}
