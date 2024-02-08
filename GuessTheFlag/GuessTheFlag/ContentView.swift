//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oğulcan Baytimur on 01/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var currentCountry = ""
    
    @State private var showingAlert = false
    @State private var isGameEnded = false
    @State private var questionCounter = 0
    @State private var animationAmount = 0.0
    @State private var tappedNumber: Int? = nil
    @State private var isButtonTapped = false
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            currentCountry = countries[number]
                            withAnimation(.spring(duration: 0.3, bounce: 0.15)) {
                                animationAmount += 360
                                tappedNumber = number
                                isButtonTapped = true
                            }
                            flagTapped(number)
                        } label: {
                            FlagImage(flagName: countries[number])
                        }
                        .rotation3DEffect( .degrees( tappedNumber == number ? animationAmount : 0 ), axis: (x: 0.0, y: 1.0, z: 0.0) )
                        .opacity(isButtonTapped ? (tappedNumber == number ? 1 : 0.5) : 1)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            }
            .alert("The Game Ended", isPresented: $isGameEnded, presenting: score) { score in
                    Button("Reset Game", action: resetGame)
                } message: { score in
                    Text("Your total score was \(score)")
                }
            .padding()
        }.alert(scoreTitle, isPresented: $showingScore, presenting: currentCountry) {currentCountry in
            Button("Continue", action: askQuestion)
        } message: {currentCountry in
            Text(scoreTitle == "Correct" ? "Yas babe, you knew it! " : "Nooo! That is \(currentCountry) you dumb fuck")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion() {
        if questionCounter == 7 { isGameEnded = true}
        questionCounter += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        tappedNumber = nil
        isButtonTapped = false
    }
    func resetGame() {
        questionCounter = 0
        score = 0
        askQuestion()
        tappedNumber = nil
        isButtonTapped = false
    }
}

struct FlagImage: View {
    var flagName: String
    var body: some View {
        Image(flagName)
            .clipShape(.capsule)
            .shadow(radius: 4)
    }
}

#Preview {
    ContentView()
}
