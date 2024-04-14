//
//  UserData.swift
//  FanDa
//
//  Created by hanseoyoung on 4/14/24.
//

import SwiftUI
import SwiftData

@Model class UserData {
    @Attribute var id: UUID
    @Transient var isTeamSelected: Bool = false
    
    
    var favoriteTeam: Team
    
    init(id: UUID = UUID(), isTeamSelected: Bool = false, favoriteTeam: Team) {
        self.id = id
        self.isTeamSelected = isTeamSelected
        self.favoriteTeam = favoriteTeam
    }
}

