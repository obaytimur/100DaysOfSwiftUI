//
//  ContentView.swift
//  iExpense
//
//  Created by Oğulcan Baytimur on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    ContentView()
}
