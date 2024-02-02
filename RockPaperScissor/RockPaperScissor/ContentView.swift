//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Oğulcan Baytimur on 02/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var moves = [
        "rock" : "✊🏻",
        "paper": "✋🏻",
        "scissors": "✌🏻"]
    
    @State private var movesArray = ["rock", "paper", "scissors"].shuffled()
    @State private var move = Int.random(in: 0...2)
    @State private var isGameWin = Bool.random()
    @State private var currentChoice = "rock"
    @State private var userScore = 0
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                .init(color: Color(red: 0.8, green: 0.8, blue: 0.8), location: 0.2),
                .init(color: .black, location: 0.7),
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 50) {
                Spacer()
                VStack {
                    Text("\(moves[movesArray[move]]!)")
                        .font(.system(size: 150))
                    Text(movesArray[move])
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                
                
                HStack(spacing: 40){
                    ForEach(movesArray, id: \.self) { key in
                        Button {
                            buttonTapped(selection: key)
                        } label: {
                            Text(moves[key]!)
                                .font(.system(size: 60))
                                .background(.white)
                                .clipShape(.capsule)
                        }
                        
                    }
                }
                
                Text(isGameWin ? "Win" : "Lose")
                    .font(.largeTitle)
                    .frame(width: 100, height: 50)
                    .background(.white)
                    .foregroundStyle(isGameWin ? .green : .red)
                
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
        }
        
    }
    func buttonTapped(selection: String) {
        if isGameWin {
            if selection == "rock" {
                if movesArray[move] == "scissors" {
                    userScore += 1
                }
            } else if selection == "paper" {
                if movesArray[move] == "rock" {
                    userScore += 1
                }
            } else {
                if movesArray[move] == "paper" {
                    userScore += 1
                }
            }
        } else {
            if selection == "rock" {
                if movesArray[move] == "paper" {
                    userScore += 1
                }
            } else if selection == "paper" {
                if movesArray[move] == "scissors" {
                    userScore += 1
                }
            } else {
                if movesArray[move] == "rock" {
                    userScore += 1
                }
            }
        }
        newQuestion()
    }
    func newQuestion() {
        movesArray.shuffle()
        move = Int.random(in: 0...2)
        isGameWin = Bool.random()
    }
}



extension ContentView {
    func getRandomMove() -> String {
        return moves.keys.randomElement()!
    }
    
}

#Preview {
    ContentView()
}
