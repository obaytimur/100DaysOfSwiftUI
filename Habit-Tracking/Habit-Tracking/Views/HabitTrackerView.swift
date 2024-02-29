//
//  HabitTrackerView.swift
//  Habit-Tracking
//
//  Created by Oğulcan Baytimur on 29/02/2024.
//

import SwiftUI

struct HabitTrackerView: View {
    private let fixedColumn = [
            GridItem(.fixed(20)),
            GridItem(.fixed(20)),
            GridItem(.fixed(20)),
            GridItem(.fixed(20)),
            GridItem(.fixed(20)),
            GridItem(.fixed(20)),
            GridItem(.fixed(20))
        ]
    @Binding var habit: Habit
    var body: some View {
        ScrollView {
            LazyVGrid(columns: fixedColumn, spacing: 10) {
                ForEach(0..<habit.history.count, id: \.self ) {tracker in
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(habit.history[tracker] == completeness.success ? .green : .black)
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                }
            }
        }
        .padding()
    }
}

#Preview {
    HabitTrackerView(habit: .constant(Constants.exHabit))
}
