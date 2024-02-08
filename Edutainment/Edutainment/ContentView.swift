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
    
    var body: some View {
        
        VStack {
            settingView
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
                Text("Upto which number do you want to study")
                Spacer()
                Picker("Select first number", selection: $uptoNumber) {
                    ForEach(0..<13) {
                        Text("\($0)")
                    }
                }
            }
            HStack {
                Text("Second Multiplicant")
                Spacer()
                Picker("Select first number", selection: $totalNumber) {
                    ForEach(0..<13) {
                        Text("\($0)")
                    }
                }
            }
        }
    }
}

extension ContentView {
    private var questionView: some View {
        VStack {
        
        }
    }
}

#Preview {
    ContentView()
}
