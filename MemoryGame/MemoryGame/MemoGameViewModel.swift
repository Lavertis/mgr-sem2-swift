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
        Color.orange: ["🍇", "🍈", "🥑", "🍉", "🍏", "🍐", "🍊", "🍎"],
        Color.blue: ["🐻", "🐻‍❄️", "🐼", "🐶", "🦊", "🦁", "🐯", "🐵", "🙈"],
        Color.red: ["🤣", "😂", "😜", "🤠", "😈", "👻", "🤖"]
    ]
    
    private static func createMemoGame(color: Color = .orange) -> MemoGameModel<String> {
        guard let pairCount = emojis[color]?.count else {
            fatalError("Emojis for color not found")
        }
        return MemoGameModel<String>(numberOfPairsOfCards: pairCount) { index in
            if let themeEmojis = emojis[color], themeEmojis.indices.contains(index) {
                return themeEmojis[index]
            }
            else {
                return "??"
            }
        }
    }
    
    @Published private var model = createMemoGame()
    
    var themeColor: Color = .orange
    var cards: Array<MemoGameModel<String>.Card> { model.cards }
    var score: Int { model.score }
    
    func shuffle() {
        withAnimation {
            model.shuffle()
        }
    }
    
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func chooseTheme(color: Color) {
        themeColor = color
        model = MemoGameViewModel.createMemoGame(color: color)
    }
}
