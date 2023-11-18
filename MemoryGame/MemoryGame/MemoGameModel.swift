//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by Rafał on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent : Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex + 1)a", content: content))
            cards.append(Card(id: "\(pairIndex + 1)b", content: content))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set {
            return cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
                
                // hide last cards
                if cards.allSatisfy({ $0.isMatched }) {
                    cards.indices.forEach { cards[$0].isFaceUp = false }
                }
            }
        }
    }
    
    struct Card: Equatable, Identifiable {
        var id: String
        var content: CardContent
        var isFaceUp = false
        var isMatched = false
    }
}
