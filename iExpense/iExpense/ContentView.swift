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
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount) ]


    var body: some View {
        NavigationStack {
            ExpenseView(sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                Menu("Sort", systemImage: "list.number"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount)
                            ])
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
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
