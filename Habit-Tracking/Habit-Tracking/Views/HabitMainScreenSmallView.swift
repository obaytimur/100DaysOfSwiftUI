//
//  HabitMainScreenSmallView.swift
//  Habit-Tracking
//
//  Created by Oğulcan Baytimur on 29/02/2024.
//

import SwiftUI

struct HabitMainScreenSmallView: View {
    var habit: Habit
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
            .foregroundStyle(Color.gray.opacity(0.3))
            HStack {
                HabitTrackerView(habit: habit)
                    .padding()
                Rectangle()
                    .frame(width: 2, height: 70)
                    .foregroundStyle(.black)
                Spacer()
                Button() {
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .scaleEffect(3)
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    HabitMainScreenSmallView(habit: Constants.exHabit)
}
