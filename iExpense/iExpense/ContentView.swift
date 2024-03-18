//
//  ContentView.swift
//  iExpense
//
//  Created by Oğulcan Baytimur on 15/02/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    @State private var showingAddExpense = false


    var body: some View {
        NavigationStack {
            ExpenseView()
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView()
                } label : {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
