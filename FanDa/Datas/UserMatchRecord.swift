//
//  UserMatchRecord.swift
//  FanDa
//
//  Created by hanseoyoung on 4/14/24.
//

import Foundation

enum matchRecordType {
    case win
    case lose
    case none
}

struct UserMatchRecord: Identifiable {
    var id = UUID().uuidString
    var matchOutcome: matchRecordType
    var matchOpponent: Team?
    var pog: String?
    var matchSet: String?
    var todayEmoji: String?
    var detail: String?
    var matchDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

//Samples

var matches: [UserMatchRecord] = [
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용", matchDate: getSampleDate(offset: 3)),
    UserMatchRecord(matchOutcome: matchRecordType.lose, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용", matchDate: getSampleDate(offset: -1)),
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용", matchDate: getSampleDate(offset: 5)),
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용", matchDate: getSampleDate(offset: 8)),
    UserMatchRecord(matchOutcome: matchRecordType.win, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용", matchDate: Date()),
    UserMatchRecord(matchOutcome: matchRecordType.lose, matchOpponent: teams[2], pog: "Viper", matchSet: "3:0", todayEmoji: "🥇", detail: "내용내용", matchDate: getSampleDate(offset: -6)),




]
