//
//  InputModalView.swift
//  FanDa
//
//  Created by hanseoyoung on 4/16/24.
//

import SwiftUI

struct InputModalView: View {
    let teamNameData = ["Gen.G", "T1"]
    let teamMembers = ["Doran", "Peanut", "Zeka", "Viper", "Delight"]
    let emojis = ["😀", "😊"]
    
    @State private var openMenu: Bool = false
    @State var matchTeam: String = "상대팀 선택"
    @State var detailWritten: String = ""
    @State var pogWritten: String = "선수 선택"
    @State var setWritten = ""
    @State var emojiWritten: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("VS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Menu {
                    Picker(selection: $matchTeam) {
                        ForEach(teamNameData, id: \.self) { team in
                            Text(team)
                            
                        }
                    } label: {}
                } label: {
                    Text(matchTeam)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }.id(matchTeam)
                
            }
            TextField("내용을 입력하세요.", text: $detailWritten)
                .padding(.all, 10)
                .frame(height: 100)
            Divider()
            
            Text("나만의 POG")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 350, alignment: .leading)
                .padding(.all, 0)
            Menu {
                Picker(selection: $pogWritten) {
                    ForEach(teamMembers, id: \.self) { team in
                        Text(team)
                        
                    }
                } label: {}
            } label: {
                Text(pogWritten)
                    .frame(width: 350, height: 65)
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0))
                    .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0))
                            )
                            .padding([ .horizontal])
            }.id(teamMembers)
            
            
            
            
            Text("세트 결과")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 350, alignment: .leading)
                .padding(.all, 0)
            
            TextField("결과를 입력하세요", text: $setWritten)
                .frame(width: 350, height: 65)
                .multilineTextAlignment(.center)
                .font(.title)
                .foregroundColor(.black)
                .background(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0))
                .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0))
                        )
                        .padding([.horizontal])
            
            Text("오늘의 이모지")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 350, alignment: .leading)
                .padding(.all, 0)
            Menu {
                Picker(selection: $emojiWritten) {
                    ForEach(emojis, id: \.self) { emoji in
                        Text(emoji)
                        
                    }
                } label: {}
            } label: {
                Text(emojiWritten)
                    .frame(width: 350, height: 65)
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0))
                    .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0))
                            )
                            .padding([ .horizontal])
            }.id(emojis)
            
            
        }
        
    }
}


#Preview {
    InputModalView()
}
