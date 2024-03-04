//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Oğulcan Baytimur on 26/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""

    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ContentView()
}
