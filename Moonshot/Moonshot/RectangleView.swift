//
//  RectangleView.swift
//  Moonshot
//
//  Created by Oğulcan Baytimur on 28/02/2024.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    RectangleView()
}
