//
//  AdjusterButton.swift
//  MemoryGame
//
//  Created by Rafał on 15/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    let icon: Image
    let text: String
    @Binding var isDisabled: Bool
    @Binding var color: Color
    @State var action: () -> ()
    
    var body: some View {
        VStack {
            icon.font(.title)
            Text(text)
        }
        .disabled(isDisabled)
        .font(.headline)
        .foregroundColor(isDisabled ? .gray : color)
        .onTapGesture(perform: isDisabled ? {} : action)
    }
}

#Preview {
    @State var isDisabled = false
    return ThemeButton(
        icon: Image(systemName: "heart"),
        text: "Theme 1",
        isDisabled: $isDisabled,
        color: .constant(.blue),
        action: {}
    )
}
