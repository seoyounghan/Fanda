//
//  Teams.swift
//  FanDa
//
//  Created by hanseoyoung on 4/13/24.
//

import Foundation

struct Team: Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
}

var teams: [Team] = [
    Team(name: "Gen.G", imageName: "image0"),
    Team(name: "T1", imageName: "image1"),
    Team(name: "kt Rolster", imageName: "image2"),
    Team(name: "Hanwha Life Esports", imageName: "image3"),
    Team(name: "Dplus KIA", imageName: "image4"),
    Team(name: "DRX", imageName: "image5"),
    Team(name: "FearX", imageName: "image6"),
    Team(name: "OKSavingsBank BRION", imageName: "image7"),
    Team(name: "Nongshim RedForce", imageName: "image8"),
    Team(name: "KWANGDONG FREECS", imageName: "image9")
]
