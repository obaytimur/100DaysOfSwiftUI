//
//  AddHabitSheetView.swift
//  Habit-Tracking
//
//  Created by Oğulcan Baytimur on 01/03/2024.
//

import SwiftUI

struct AddHabitSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var habits: userHabits
    @State private var newHabit = Habit(name: "", description: "", frequency: 1, history: [])
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Habit Name", text: $newHabit.name)
                    TextField("Description:", text: $newHabit.description)
                }
                Section {
                    Picker("Daily Frequency", selection: $newHabit.frequency) {
                        ForEach(0..<9){
                            Text(String($0))
                        }
                    }
                }
                Text(String(newHabit.frequency))
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem {
                    Button("Save"){
                        habits.habits.append(newHabit)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddHabitSheetView(habits: .constant(Constants.exUserHabit) )
}
