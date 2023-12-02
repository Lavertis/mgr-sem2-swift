//
//  CardView.swift
//  MemoryGame
//
//  Created by Rafał on 15/10/2023.
//

import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card) {
        self.card = card
    }
    
    func isShown() -> Bool {
        return card.isFaceUp || !card.isMatched
    }
    
    var body: some View {
        CirclePart(endAngle: .degrees(240))
            .opacity(0.5)
            .overlay(
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .rotationEffect(
                        .degrees(card.isMatched ? 360 : 0)
                    )
                    .animation(.spin(duration: 2), value: card.isMatched)
            )
            .padding(4)
            .transformIntoCard(isFaceUp: card.isFaceUp)
            .opacity(isShown() ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: card.isFaceUp)
    }
}

#Preview {
    CardView(MemoGameModel<String>.Card(id: "1", content: "🍎", isFaceUp: true))
}
