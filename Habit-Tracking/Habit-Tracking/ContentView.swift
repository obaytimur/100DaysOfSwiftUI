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
                    HabitMainScreenSmallView(habit: habit)
                })
            }
            .listStyle(.plain)
            .navigationTitle("Habits")
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        let myExObject = userHabits()
        myExObject.habits.append(Constants.exHabit)
        return ContentView(habits: myExObject)
    }
}
