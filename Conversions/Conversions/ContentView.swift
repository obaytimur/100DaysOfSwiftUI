//
//  ContentView.swift
//  Conversions
//
//  Created by Oğulcan Baytimur on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var conType: conversionType = .temperature
    @State var input: Double = 0.00
    
    @FocusState private var amountIsFocused: Bool
    
    @State var tempInput: temperatures = .celcius
    @State var tempOutput: temperatures = .fahrenheit
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select conversion type") {
                    Picker("Select conversition type", selection: $conType) {
                        ForEach(conversionType.allCases, id: \.self){
                            Text($0.localizedName)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    switch conType {
                    case .temperature:
                        temperature
                    case .length:
                        length
                    case .time:
                        time
                    case .volume:
                        volume
                    }
                }
            }
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum conversionType: String, CaseIterable{
    case temperature = "Temperature"
    case length = "Length"
    case time = "Time"
    case volume = "Volume"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue)}
}

enum temperatures: String, CaseIterable {
    case celcius = "Celcius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue)}

}

extension ContentView {
    private var temperature: some View {
        VStack {
            
            var compOutput: Double {
                var result: Double
                var output: Double
                switch tempInput {
                case .celcius: result = input
                case .kelvin: result = input - 275
                case .fahrenheit: result = (input - 32) * 5 / 9
                }
                print(result)
                switch tempOutput {
                case .celcius: output = result
                case .kelvin: output = result + 275
                case .fahrenheit: output = result * 9 / 5 + 32
                }
                print(output)
                return output
            }
            
            HStack{
                Text("Input:")
                    .frame(width: 60, alignment: .leading)
                Picker("Select Input unit", selection: $tempInput){
                    ForEach(temperatures.allCases, id: \.self){
                        Text($0.localizedName)
                    }
                }
                .pickerStyle(.segmented)
            }
            HStack{
                Text("Output:")
                    .frame(width: 60, alignment: .leading)
                Picker("Select Output Unit", selection: $tempOutput){
                    ForEach(temperatures.allCases, id: \.self){
                        if($0 != tempInput) {
                            Text($0.localizedName)
                        }
                    }
                }
                .pickerStyle(.segmented)
            }
            Section {
                HStack {
                    Text("Input in \(tempInput.rawValue)")
                        .scaledToFill()
                    Spacer()
                    TextField("Temperature", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .focused($amountIsFocused)
                }
                HStack {
                    Text("Output in \(tempOutput.rawValue)")
                        .scaledToFit()
                    Spacer()
                    Text(compOutput, format: .number)
                }
            }
        }
    }
}

extension ContentView {
    private var length: some View {
        Text("Length View")
    }
}

extension ContentView {
    private var time: some View {
        Text("Time View")
    }
}

extension ContentView {
    private var volume: some View {
        Text("Volume View")
    }
}
