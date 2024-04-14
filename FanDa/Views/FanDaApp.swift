//
//  FanDaApp.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import SwiftUI
import SwiftData

@main
struct FanDaApp: App {
    var userModelContainer: ModelContainer = {
        let schema = Schema([UserData.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("\(error)")
        }
    } ()
    
    @Environment(\.modelContext) private var modelContext
    @State private var userDatas: UserData?
    var body: some Scene {
        WindowGroup {
            
            if let userDatas {
                CalendarView()
            } else {
                SelectTeam()
                    .modelContainer(userModelContainer)
            }
        }
        
    }
}
