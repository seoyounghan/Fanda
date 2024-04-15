//
//  DiaryLiesView.swift
//  FanDa
//
//  Created by hanseoyoung on 4/15/24.
//

import SwiftUI

struct DiaryListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(matches) { match in
                    if let matchOppo = match.matchOpponent {
                        HStack {
                            Image("\(matchOppo.imageName)")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                                .frame(width: 90)
                                .padding(.leading, 10)
                                
                            
                            Spacer()
                                .frame(width: 30)
                            
                            VStack(alignment: .leading) {
                                Text("\(match.detail!)")
                                    .fontWeight(.bold)
                                    .frame(width: 170, height: 80, alignment: .leading)
                                    .lineLimit(3)
                                    .allowsTightening(true)
                                
                                Text("\(extraData(detailDate: match.matchDate)[0]).\(extraData(detailDate: match.matchDate)[1]).\(extraData(detailDate: match.matchDate)[2]) \(match.todayEmoji!)")
                                    .fontWeight(.thin)
                                    .font(.footnote)
                            }
                            
                        }
                        .frame(width: 300, height: 100)
                        .padding(.all, 20)
                        
                        .background(backgroundColor(matchOutcome: match.matchOutcome))
                        .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(backgroundColor(matchOutcome: match.matchOutcome))
                                )
                                .padding([.top, .horizontal])
                        
                    }
                    
                    
                }
            }
        }
    
    }
    func backgroundColor(matchOutcome: matchRecordType) -> Color {
        switch matchOutcome {
        case .win: return Color(red: 135/255, green: 192/255, blue: 255/255, opacity: 1.0)
        case .lose: return Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0)
        default: return Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0)
        }
    }
    func extraData(detailDate: Date) -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MM dd"
        
        let date = formatter.string(from: detailDate)
        
        return date.components(separatedBy: " ")
    }
    
}

#Preview {
    DiaryListView()
}
