//
//  UserMatchRecord.swift
//  FanDa
//
//  Created by hanseoyoung on 4/14/24.
//

import Foundation
import SwiftData

enum matchRecordType: Codable {
    case win
    case lose
    case none
}

@Model class UserMatchRecord: Identifiable {
    var id = UUID()
    var matchOutcome: matchRecordType
    var matchOpponent: Team
    var pog: String
    var matchSet: String
    var todayEmoji: String
    var detail: String
    var matchDate: Date
    
    
    init(id: UUID = UUID(), matchOutcome: matchRecordType, matchOpponent: Team, pog: String, matchSet: String, todayEmoji: String, detail: String, matchDate: Date) {
        self.id = id
        self.matchOutcome = matchOutcome
        self.matchOpponent = matchOpponent
        self.pog = pog
        self.matchSet = matchSet
        self.todayEmoji = todayEmoji
        self.detail = detail
        self.matchDate = matchDate
    }
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}



//Samples

var matches: [UserMatchRecord] = [
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용1", matchDate: getSampleDate(offset: 3)),
    UserMatchRecord(matchOutcome: matchRecordType.lose, matchOpponent: teams[5], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용2", matchDate: getSampleDate(offset: -1)),
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[8], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용3", matchDate: getSampleDate(offset: 5)),
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[0], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용4", matchDate: getSampleDate(offset: 8)),
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[1], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용5", matchDate: Date()),
    UserMatchRecord(matchOutcome: matchRecordType.lose, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용6", matchDate: getSampleDate(offset: -6)),
    UserMatchRecord(matchOutcome: matchRecordType.lose, matchOpponent: teams[0], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용7", matchDate: getSampleDate(offset: -9)),
    UserMatchRecord(matchOutcome: matchRecordType.lose, matchOpponent: teams[0], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용8리스트 뷰의 내용은 세줄까지만 표현됩니다.오예.내용내요애용", matchDate: getSampleDate(offset: 10)),
]
