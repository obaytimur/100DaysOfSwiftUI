//
//  ListView.swift
//  Moonshot
//
//  Created by Oğulcan Baytimur on 28/02/2024.
//

import SwiftUI

struct ListView: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    var body: some View {
        List(missions) {mission in
            Group {
                NavigationLink(value: mission,
                label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                })
            }
            .listRowBackground(Color.darkBackground)
        }
        .navigationDestination(for: Mission.self) { selection in
            MissionView(mission: selection, astronauts: astronauts)
        }
        .padding([.horizontal, .bottom])
        .listStyle(.plain)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return ListView(missions: missions, astronauts: astronauts)
}
