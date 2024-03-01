//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by Oğulcan Baytimur on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var habits = userHabits()
    @State private var addHabit = false
    var body: some View {
        NavigationStack {
            List(habits.habits) {habit in
                NavigationLink(value: habit, label: {
                    VStack(alignment: .leading) {
                        Text(habit.name)
                        HabitMainScreenSmallView(habit: habit)
                    }
                })
            }
            .listStyle(.plain)
            .navigationTitle("Habits")
            .toolbar{
                ToolbarItem{
                    Button("Add Habit"){
                        addHabit = true
                    }
                }
            }
            .navigationDestination(for: Habit.self) { selection in
                HabitDetailView()
            }
            .sheet(isPresented: $addHabit) {
                AddHabitSheetView(habits: $habits)
            }
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
