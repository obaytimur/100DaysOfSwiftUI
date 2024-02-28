//
//  ContentView.swift
//  Moonshot
//
//  Created by Oğulcan Baytimur on 17/02/2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var isGridView = true

    var body: some View {
        NavigationStack {
            Group {
                if isGridView {
                    GridView(missions: missions, astronauts: astronauts)
                } else {
                    ListView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                ToolbarItem {
                    HStack {
                        Image(systemName: "list.bullet")
                        Toggle("", isOn: $isGridView)
                            .toggleStyle(.switch)
                        Image(systemName: "square.grid.2x2.fill")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
