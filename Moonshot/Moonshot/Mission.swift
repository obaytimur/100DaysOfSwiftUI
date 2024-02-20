//
//  Mission.swift
//  Moonshot
//
//  Created by Oğulcan Baytimur on 20/02/2024.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
