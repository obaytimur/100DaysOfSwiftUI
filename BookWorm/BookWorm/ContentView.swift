//
//  ContentView.swift
//  BookWorm
//
//  Created by Oğulcan Baytimur on 07/03/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]

    @State private var showingAddScreen = false

    var body: some View {
        NavigationStack {
           Text("Count: \(books.count)")
               .navigationTitle("Bookworm")
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       Button("Add Book", systemImage: "plus") {
                           showingAddScreen.toggle()
                       }
                   }
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView()
               }
       }
    }
}

#Preview {
    ContentView()
}
