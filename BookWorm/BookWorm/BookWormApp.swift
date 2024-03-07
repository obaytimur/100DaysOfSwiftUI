//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Oğulcan Baytimur on 07/03/2024.
//

import SwiftData
import SwiftUI

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
