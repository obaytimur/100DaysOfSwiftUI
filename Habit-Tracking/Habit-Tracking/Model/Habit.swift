//
//  Habit.swift
//  Habit-Tracking
//
//  Created by Oğulcan Baytimur on 29/02/2024.
//

import Foundation

struct Habit: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var description: String
    var frequency: Int
    var history: [completeness]
}

enum completeness: Codable {
    case success, fail
}

@Observable
class userHabits {
    var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
}
