//
//  ContentView.swift
//  WordScramble
//
//  Created by Oğulcan Baytimur on 06/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var rootWordMixed = ""
    @State private var newWord = ""
    @State private var mixingLetters = false
    
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text(String(rootWordMixed))
                    Spacer()
                    Button ("Shuffle Letters", action: mixLetters)
                }
                .padding()
                List {
                    Section {
                        HStack{
                            TextField("Enter your word", text: $newWord)
                                .textInputAutocapitalization(.never)
                            Text("Score: \(score)")
                        }
                    }

                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack{
                                Text(word)
                                Image(systemName: "\(word.count).circle")
                            }
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        startGame()
                    } label: {
                        Text("New Word")
                    }
                }
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    func addScore (word: String) {
        score += word.count
    }
    func isShort(word: String) -> Bool {
        !(word.count <= 2)
    }
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {return false}
        }
        return true
    }
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misSpelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misSpelledRange.location == NSNotFound
    }
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func mixLetters() {
        rootWordMixed = String(rootWord.shuffled())
        mixingLetters = true
    }
    func startGame() {
        if let startWordUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordUrl) {
                let allWords = startWords.components(separatedBy: "\n")
                score = 0
                rootWord = allWords.randomElement() ?? "silkworm"
                rootWordMixed = ""
                mixingLetters = false
                usedWords = [String]()
                return
            }
        }
        
        fatalError("Could not load start.txt from the bundle")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        guard isShort(word: answer) else {
            wordError(title: "Too Short", message: "You cannot write words shorter than 3 characters")
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "Used Word", message: "Maybe pay attention more")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Not Possible", message: "You cannot write this word with the given rootword")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Not a Word", message: "This word is not used in english")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        addScore(word: answer)
        newWord = ""
    }
}

#Preview {
    ContentView()
}
