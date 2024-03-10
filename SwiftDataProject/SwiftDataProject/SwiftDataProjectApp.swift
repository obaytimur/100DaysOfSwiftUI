//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Oğulcan Baytimur on 10/03/2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
