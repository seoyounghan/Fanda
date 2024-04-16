//
//  SelectTeam
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import SwiftUI
import SwiftData

struct SelectTeam: View {
    @State private var selectedID: UUID = UUID()
    @State private var selectedTeam: Team?
    @State private var userDatas: UserData?
    @State private var tag: Bool = false
    @Environment(\.modelContext) var modelContext
    
    @Query private var qur: [UserData]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("좋아하는 팀을 선택하세요.")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .padding(.bottom, 50)
                    .padding(.top, 30)
                
                ForEach(teams, id: \.id) { team in
                    Button(action: {
                        selectedID = team.id
                        selectedTeam = team
                    }, label: {
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(team.name)")
                                    .fontWeight(.regular)
                                    .colorMultiply(.black)
                                    .multilineTextAlignment(.leading)
                                    .frame(alignment: .leading)
                                    .padding(.leading, 30)
                                Spacer()
                                if selectedID == team.id {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                        .padding(.trailing, 30)
                                    
                                    
                                } else {
                                    Image(systemName: "heart")
                                        .colorMultiply(.black)
                                        .padding(.trailing, 30)
                                }
                                
                            }
                            Divider()
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                        }
                    })
                }
                Spacer(minLength: 30)
                if let selectedTeam {
                    
                    Button(action: {
                        modelContext.insert(UserData(isTeamSelected: true, favoriteTeam: selectedTeam))
                        let _ = print(qur[0].favoriteTeam.name)
                        self.tag = true
                    }, label: {
                        
                        Text("Start")
                            .frame(width: 300, height: 30)
                        
                        
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .padding(.bottom, 40)
                    .navigationDestination(isPresented: $tag) {
                        CalendarView()
                    }
                    
                    
                    
                    
                    
                }
            }
            
            
        }
    }
}

#Preview {
    SelectTeam()
}
