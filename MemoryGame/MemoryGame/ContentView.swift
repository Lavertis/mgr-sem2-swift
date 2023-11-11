//
//  ContentView.swift
//  MemoryGame
//
//  Created by Rafał on 10/10/2023.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack {
            ScrollView { cards }
            Button("Shuffle") { viewModel.shuffle() }
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
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }.foregroundColor(viewModel.themeColor)
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
