//
//  ContentView.swift
//  MemoryGame
//
//  Created by Rafał on 10/10/2023.
//

import SwiftUI


struct ContentView: View {
    typealias Card = MemoGameModel<String>.Card
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack {
            ScrollView { cards }
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Button("SHUFFLE") {
                    viewModel.shuffle()
                }
                .font(.title3)
            }
            .font(.title)
            .padding(.horizontal)
            
            Spacer().frame(height: 30)
            themeButtons
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(cardId: card.id)))
                    .onTapGesture { chooseCard(card) }
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
    private func chooseCard(_ card: Card) {
        let scoreBeforeChoosing = viewModel.score
        viewModel.choose(card: card)
        let scoreChange = viewModel.score - scoreBeforeChoosing
        lastScoreChange = (amount: scoreChange, causedByCardId: card.id)
    }
    
    @State private var lastScoreChange = (amount: 0, causedByCardId: "")
    
    private func scoreChange(cardId: Card.ID) -> Int {
        if cardId == lastScoreChange.causedByCardId {
            return lastScoreChange.amount
        } else {
            return 0
        }
    }
    
    var themeButtons: some View {
        let columns = [GridItem(.adaptive(minimum: 100))]
        return LazyVGrid(columns: columns, spacing: 15) {
            ThemeButton(
                viewModel: viewModel,
                image: Image(systemName: "smiley"),
                text: "Theme 1",
                color: .orange
            )
            ThemeButton(
                viewModel: viewModel,
                image: Image(systemName: "shuffle"),
                text: "Theme 2",
                color: .blue
            )
            ThemeButton(
                viewModel: viewModel,
                image: Image(systemName: "heart"),
                text: "Theme 3",
                color: .red
            )
        }
    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
