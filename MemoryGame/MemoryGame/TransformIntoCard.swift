//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by Rafał on 28/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base
                .strokeBorder(lineWidth: 3)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1: 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

extension View {
    func transformIntoCard(isFaceUp: Bool) -> some View {
        self.modifier(TransformIntoCard(isFaceUp: isFaceUp))
    }
}
