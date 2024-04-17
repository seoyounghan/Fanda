//
//  InputModalView.swift
//  FanDa
//
//  Created by hanseoyoung on 4/16/24.
//

import SwiftUI
import SwiftData

struct InputModalView: View {
    let emojis = ["😀", "😊", "🥇", "🙌🏻", "🤬"]
    
    @State private var openMenu: Bool = false
    @State var matchTeam: String
    @State var detailWritten: String
    @State var pogWritten: String
    @State var setWritten: String
    @State var emojiWritten: String
    @Binding var winLoseClicked: Int
    
    @Binding var showModal: Bool
    
    @Environment(\.modelContext) private var modelContext
    @Query private var userData: [UserData]
    @Query private var matchRecord: [UserMatchRecord]
    
    var todayWritten: [UserMatchRecord] {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return matchRecord.filter({dateFormatter.string(from: $0.matchDate) == dateFormatter.string(from: Date())})
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("VS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Menu {
                    Picker(selection: $matchTeam) {
                        ForEach(teamNameData, id: \.self) { team in
                            if team != userData[0].favoriteTeam.name {
                                Text(team)
                            }
                            
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
                    ForEach(userData[0].favoriteTeam.teamMembers, id: \.self) { team in
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
            }.id(userData[0].favoriteTeam.teamMembers)
            
            
            
            
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
            
            Button(action: {
                if todayWritten.count > 0 {
                    do {
                        modelContext.delete(todayWritten[0])
                        try modelContext.save()
                    } catch {
                        print("error")
                    }
                }
                
                do {
                    modelContext.insert(UserMatchRecord(matchOutcome: intToMatchRecordType(myInt: winLoseClicked), matchOpponent: findTeam(teamName: matchTeam), pog: pogWritten, matchSet: setWritten, todayEmoji: emojiWritten, detail: detailWritten, matchDate: Date()))
                    try modelContext.save()
                } catch {
                    print("error")
                }
                showModal = false
            }, label: {
                Text("저장")
                    .foregroundColor(Color.white)
                    .frame(height: 30)
                    .fontWeight(.bold)
            })
            .frame(width: 350, height: 65)
            .multilineTextAlignment(.center)
            .font(.title)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0))
                    )
                    .padding([.top, .bottom], 30)

            
            
        }
        
        
    }
    
    func intToMatchRecordType(myInt: Int) -> matchRecordType {
        if myInt == 0 {
            return matchRecordType.none
        } else if myInt == 1 {
            return matchRecordType.win
        } else {
            return matchRecordType.lose
        }
    }
    
    func findTeam(teamName: String) -> Team {
        var tag = false
        for team in teams {
            if team.name == teamName {
                tag = true
                return team
            }
        }
        if tag == false {
            return teams[0]
        }
    }
}


