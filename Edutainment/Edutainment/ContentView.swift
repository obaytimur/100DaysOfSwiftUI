//
//  ContentView.swift
//  Edutainment
//
//  Created by Oğulcan Baytimur on 08/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var gameState: states = .editSetting
    @State private var uptoNumber = 1
    @State private var totalNumber = 1
    @State private var questionArray: [ [Int] ] = Array()
    @State private var answerArr: [Int] = Array()
    
    var body: some View {
        VStack {
            settingView
            questionView
        }
        .padding()
    }
    
    enum states {
        case playing, editSetting, ended
    }
}

extension ContentView {
    private var settingView: some View {
        VStack {
            HStack {
                Text("Upto which number do you want to study?")
                Spacer()
                Picker("Select number", selection: $uptoNumber) {
                    ForEach(0..<13) {
                        Text("\($0)")
                    }
                }
            }
            HStack {
                Text("Numer of total question")
                Spacer()
                Picker("Select question number", selection: $totalNumber) {
                    ForEach(1..<5) {
                        Text("\($0*5)")
                    }
                }
            }
            Text("Study numbers: \(uptoNumber) and total questions \(totalNumber)")
        }
    }
    private var questionView: some View {
        ForEach(generateQuestions(), id: \.self) { $question in
            HStack {
                Text("\(question[0]) x \(question[1])")
            }
            .padding()
            .frame(width: 120, height: 30)
            .background(Color.green)
            .clipShape(.capsule)
        }
    }
    func generateQuestions () -> Binding<[ [Int] ]>{
        @State var retArr: [ [Int] ] = Array()
        for _ in 1...(totalNumber+1)*5 {
            retArr.append([Int.random(in: 0..<uptoNumber+1), Int.random(in: 0..<uptoNumber+1), 0])
        }
        return $retArr
    }

}

#Preview {
    ContentView()
}
