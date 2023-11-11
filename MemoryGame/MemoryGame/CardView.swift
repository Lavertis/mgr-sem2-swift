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
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            base
                .opacity(card.isFaceUp ? 0 : 1)
                .animation(.easeInOut(duration: 0.5), value: card.isFaceUp)
        }
        .opacity(isShown() ? 1 : 0)
        .animation(.easeInOut(duration: 0.5), value: isShown())
    }
}

#Preview {
    CardView(MemoGameModel<String>.Card(id: "1", content: "🍎"))
}
