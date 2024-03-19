//
//  ExpenseView.swift
//  iExpense
//
//  Created by Oğulcan Baytimur on 18/03/2024.
//

import SwiftData
import SwiftUI

struct ExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    init(itemType: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { item in
            item.type == itemType
        }, sort: sortOrder)
    }
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(item.amount < 10 ? Color.green : (item.amount < 100 ? Color.blue : Color.red))
                }
            }
            .onDelete(perform: removeItems)
        }
        
    }
    func removeItems(at offsets: IndexSet) {
        try? modelContext.delete(model: ExpenseItem.self)
    }
}

#Preview {
    ExpenseView(itemType: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
