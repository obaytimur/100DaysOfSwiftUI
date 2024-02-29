//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by Oğulcan Baytimur on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var habits = userHabits()
    var body: some View {
        NavigationStack {
            List(habits.habits) {habit in
                NavigationLink(value: habit, label: {
                    Text(habit.name)
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
