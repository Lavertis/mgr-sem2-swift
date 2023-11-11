//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by Rafał on 07/11/2023.
//

import Foundation
import SwiftUI

class MemoGameViewModel : ObservableObject {
    private static let emojis: [Color: [String]] = [
        Color.orange: ["🍇", "🍈", "🥑", "🍉", "🍏", "🍐", "🍊", "🍎", "🍑", "🍑"],
        Color.blue: ["🐻", "🐻‍❄️", "🐻‍❄️", "🐼", "🐶", "🦊", "🦁", "🐯", "🐵", "🙈"],
        Color.red: ["🤣", "😂", "😇", "🥰", "😜", "😜", "🤠", "😈", "👻", "🤖"]
    ]
    
    private static func createMemoGame(color: Color = .orange) -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: 8) { index in
            if let themeEmojis = emojis[color], themeEmojis.indices.contains(index) {
                return themeEmojis[index]
            }
            else {
                return "??"
            }
        }
    }
    
    @Published private var model = createMemoGame()
    @Published var themeColor: Color = .orange
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func chooseTheme(color: Color) {
        themeColor = color
        model = MemoGameViewModel.createMemoGame(color: color)
    }
}
