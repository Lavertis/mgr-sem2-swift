//
//  AdjusterButton.swift
//  MemoryGame
//
//  Created by Rafał on 15/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    @ObservedObject var viewModel: MemoGameViewModel
    let image: Image
    let text: String
    var color: Color
    
    var body: some View {
        Button(action: {
            viewModel.chooseTheme(color: color)
        }, label: {
            VStack {
                image.font(.title)
                Text(text)
            }
        })
        .foregroundColor(isDisabled() ? .gray : viewModel.themeColor)
        .disabled(isDisabled())
    }
    
    func isDisabled() -> Bool {
        return color == viewModel.themeColor
    }
}

#Preview {
    return ThemeButton(
        viewModel: MemoGameViewModel(),
        image: Image(systemName: "heart"),
        text: "Theme 1",
        color: .blue
    )
}
