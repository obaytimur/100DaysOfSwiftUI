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
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name, order: .forward),
        SortDescriptor(\ExpenseItem.amount, order: .forward)
    ]
    @State private var isAscendingOrder = true

    var body: some View {
        NavigationStack {
            ExpenseView(sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                Button("", systemImage: isAscendingOrder ? "arrow.down" : "arrow.up") {
                    isAscendingOrder.toggle()
                }
                Menu("Sort", systemImage: "list.number"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name, order: isAscendingOrder ? .forward : .reverse),
                                SortDescriptor(\ExpenseItem.amount, order: isAscendingOrder ? .forward : .reverse)
                            ])
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount, order: isAscendingOrder ? .forward : .reverse),
                                SortDescriptor(\ExpenseItem.name, order: isAscendingOrder ? .forward : .reverse)
                            ])
                    }
                }
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
