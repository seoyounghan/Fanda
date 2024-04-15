//
//  Teams.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import Foundation

struct Team: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let imageName: String
    
    let teamMembers: [String]
}

var teams: [Team] = [
    Team(name: "Gen.G", imageName: "image0", teamMembers: ["Kiin", "Canyon", "Chovy", "Peyz", "Lehends"]),
    Team(name: "T1", imageName: "image1", teamMembers: ["Zeus", "Oner", "Faker", "Gumayusi", "Keria"]),
    Team(name: "kt Rolster", imageName: "image2", teamMembers: ["PerfecT", "Pyosik", "Bdd", "Deft", "BeryL"]),
    Team(name: "Hanwha Life Esports", imageName: "image3", teamMembers: ["Doran", "Peanut", "Zeka", "Viper", "Delight"]),
    Team(name: "Dplus KIA", imageName: "image4", teamMembers: ["Kingen", "Lucid", "ShowMaker", "Aiming", "Kellin"]),
    Team(name: "DRX", imageName: "image5", teamMembers: ["Rascal", "Rponge", "kyeahoo", "Teddy", "Pleata"]),
    Team(name: "FearX", imageName: "image6", teamMembers: ["Clear", "Willer", "Clozer", "Hena", "Execute"]),
    Team(name: "OKSavingsBank BRION", imageName: "image7", teamMembers: ["Morgan", "GIDEON", "Karis", "Envyy", "Pollu"]),
    Team(name: "Nongshim RedForce", imageName: "image8", teamMembers: ["DnDn", "Sylvie", "Callme", "Jiwoo", "Peter"]),
    Team(name: "KWANGDONG FREECS", imageName: "image9", teamMembers: ["DuDu", "Cuzz", "BuLLDoG", "Bull", "Quantum"])
]


