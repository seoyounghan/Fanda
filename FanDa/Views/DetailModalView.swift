//
//
//  FanDa
//
//  Created by hanseoyoung on 4/16/24.
//

import SwiftUI
import SwiftData

struct DetailModalView: View {
    
    
    @Binding var showModal: Bool
    @Binding var detailUUID: UUID

    @Environment(\.modelContext) private var modelContext
    @Query private var userMatchedRecord: [UserMatchRecord]
    var userMatched: [UserMatchRecord] {
        return userMatchedRecord.filter({$0.id == detailUUID})
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("VS \(userMatched[0].matchOpponent.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
            
                        
            }
            Text("\(userMatched[0].detail)")
                .padding(.all, 10)
                .frame(height: 100)
            Divider()
            
            Text("나만의 POG")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 350, alignment: .leading)
                .padding(.all, 0)
            
            Text("\(userMatched[0].pog)")
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
            
            
            
            
            Text("세트 결과")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 350, alignment: .leading)
                .padding(.all, 0)
            
            Text("\(userMatched[0].matchOutcome)")
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
            
            Text("\(userMatched[0].todayEmoji)")
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
            
            Button(action: {
                showModal = false
            }, label: {
                Text("닫기")
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
    
    func intToMatchRecordType(recordType: matchRecordType) -> String {
        switch(recordType) {
        case .win: return "승리"
        case .lose: return "패배"
        default: return "무"
        }
    }
    
    
}


//#Preview {
//    DetailModalView()
//}
