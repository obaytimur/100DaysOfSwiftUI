//
//  ContentView.swift
//  Moonshot
//
//  Created by Oğulcan Baytimur on 17/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
    
    struct CustomText: View {
        let text: String

        var body: some View {
            Text(text)
        }

        init(_ text: String) {
            print("Creating a new CustomText")
            self.text = text
        }
    }
}

#Preview {
    ContentView()
}
