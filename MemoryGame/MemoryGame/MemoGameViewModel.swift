//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by Rafał on 07/11/2023.
//

import Foundation
import SwiftUI

class MemoGameViewModel : ObservableObject {
    private static let emojis = ["🍏", "🍎", "🍐", "🍊", "🕷️", "💀", "👻", "🐖", "🐨", "🐄"]
    
    private static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: 8) { index in
            if emojis.indices.contains(index) {
                return emojis[index]
            }
            else {
                return "??"
            }
        }
    }
    
    @Published private var model = createMemoGame()
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    @Published var themeColor: Color = .orange
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func chooseTheme(color: Color) {
        themeColor = color
    }
}
