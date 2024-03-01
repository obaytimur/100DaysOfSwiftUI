//
//  HabitTrackerView.swift
//  Habit-Tracking
//
//  Created by Oğulcan Baytimur on 29/02/2024.
//

import SwiftUI

struct HabitTrackerView: View {
    private let fixedColumn = [
            GridItem(.fixed(20), spacing: 3),
            GridItem(.fixed(20), spacing: 3),
            GridItem(.fixed(20), spacing: 3),
            GridItem(.fixed(20), spacing: 3),
            GridItem(.fixed(20), spacing: 3),
            GridItem(.fixed(20), spacing: 3),
            GridItem(.fixed(20), spacing: 3)
        ]
    var habit: Habit
    var body: some View {
            LazyVGrid(columns: fixedColumn, spacing: 5) {
                ForEach(0..<28, id: \.self ) {tracker in
                    if tracker < habit.history.count{
                        Rectangle()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(habit.history[tracker] == completeness.success ? .green : .black)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                    } else {
                        Rectangle()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 3)) 
                    }
                }
            }
        .padding()
    }
}

#Preview {
    HabitTrackerView(habit: Constants.exHabit)
}
