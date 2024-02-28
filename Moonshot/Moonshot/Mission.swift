//
//  Mission.swift
//  Moonshot
//
//  Created by Oğulcan Baytimur on 20/02/2024.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}
