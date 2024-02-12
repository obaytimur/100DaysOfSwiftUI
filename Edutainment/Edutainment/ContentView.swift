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
    @State private var isGameOn = false
    
    var body: some View {
        NavigationStack{
            VStack {
                if isGameOn {
                    questionView
                } else {
                    settingView
                }
            }
            .padding()
            .navigationTitle("Edutainment")
            .toolbar {
                HStack {
                    Image(systemName: "gearshape")
                    Toggle("", isOn: $isGameOn)
                        .toggleStyle(.switch)
                    Image(systemName: "gamecontroller")
                }
            }
        }
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
                .tint(Color.white)
            }
            .padding()
            HStack {
                Text("Numer of total question")
                Spacer()
                Picker("Select question number", selection: $totalNumber) {
                    ForEach(1..<5) {
                        Text("\($0*5)")
                    }
                }
                .tint(Color.white)
            }
            .padding()
            Text("Study numbers: \(uptoNumber) \n Total questions \(totalNumber)")
            Spacer()
        }
        .background(Color.teal)
        .foregroundStyle(Color.white)
        .font(.system(size: 20))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(20)
    }
    private var questionView: some View {
        VStack {
            let numberFormatter: NumberFormatter = {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .none
                    formatter.zeroSymbol  = ""
                    return formatter
                }()
            if questionArray.count != 0 {
                ForEach(questionArray, id: \.self) { question in
                    HStack {
                        Text("\(question[0]) x \(question[1])")
                            .padding()
                            .frame(width: 100, height: 30)
                            .background(Color.green)
                            .clipShape(.capsule)
                        Text("=")
                            .padding()
                            .frame(height: 30)
                            .background(Color.red)
                            .clipShape(.capsule)
                        TextField("", value: $questionArray[0][2], formatter: numberFormatter)
                            .padding()
                            .frame(height: 30)
                            .background(Color.blue)
                            .clipShape(.capsule)
                    }
                }
            }
            Button ("New Questions"){
                questionArray = generateQuestions()
            }
        }
    }
    func generateQuestions () -> [ [Int] ] {
        var retArr: [ [Int] ] = Array()
        for _ in 1...(totalNumber+1)*5 {
            retArr.append([Int.random(in: 0..<uptoNumber+1), Int.random(in: 0..<uptoNumber+1), 0])
        }
        return retArr
    }

}

#Preview {
    ContentView()
}
