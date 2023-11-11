//
//  CardView.swift
//  MemoryGame
//
//  Created by Rafał on 15/10/2023.
//

import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
//            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    
//    @State private var isFaceUp = false
//    @State var content: String
//    @Binding var color: Color
//    
//    var body: some View {
//        let base = RoundedRectangle(cornerRadius: 12)
//        ZStack {
//            Group {
//                base.fill(.white)
//                base.strokeBorder(lineWidth: 3)
//                Text(content).font(.largeTitle)
//            }
//            .opacity(isFaceUp ? 1 : 0)
//            base.fill().opacity(isFaceUp ? 0 : 1)
//        }
//        .aspectRatio(2/3, contentMode: .fit)
//        .foregroundColor(color)
//        .onTapGesture {
//            isFaceUp.toggle()
//        }
//    }
}

#Preview {
    CardView(card: MemoGameModel<String>.Card(content: "🍎", id: "1"))
}
