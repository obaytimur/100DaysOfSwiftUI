//
//  ContentView.swift
//  Navigation
//
//  Created by Oğulcan Baytimur on 22/02/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }

                        Button("Tap Me 2") {
                            // button action here
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
