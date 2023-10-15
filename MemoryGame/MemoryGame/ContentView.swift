//
//  ContentView.swift
//  MemoryGame
//
//  Created by Rafał on 10/10/2023.
//

import SwiftUI


struct ContentView: View {
    @State var color: Color = .blue
    
    private var emojis1 = Array(repeating: ["🍏", "🍎", "🍐", "🍊"], count: 4).flatMap{$0}
    private var emojis2 = Array(repeating: ["🕷️", "💀", "👻"], count: 5).flatMap{$0}
    private var emojis3 = Array(repeating: ["🐖", "🐨", "🐄"], count: 4).flatMap{$0}
    @State var emojis: [(String, UUID)] = []
    
    var body: some View {
        Text("Memo").font(.largeTitle)
        ScrollView { cards }.padding()
        themeButtons.onAppear(perform: { changeColor(newColor: .blue) })
    }
    
    var cards: some View {
        let columns = [GridItem(.adaptive(minimum: 80))]
        return LazyVGrid(columns: columns, spacing: 15) {
            ForEach(emojis, id: \.1) { emoji, id in
                CardView(content: emoji, color: $color)
            }
        }.foregroundColor(Color.blue)
    }
    
    func changeColor(newColor: Color) {
        color = newColor
        switch color {
        case .blue:
            emojis = emojis1.map{ ($0, UUID()) }
        case .red:
            emojis = emojis2.map{ ($0, UUID()) }
        case .green:
            emojis = emojis3.map{ ($0, UUID()) }
        default:
            emojis = emojis1.map{ ($0, UUID()) }
        }
        emojis.shuffle()
    }
    
    var themeButtons: some View {
        @State var isBlueDisabled = color == .blue
        @State var isRedDisabled = color == .red
        @State var isGreenDisabled = color == .green
        let columns = [GridItem(.adaptive(minimum: 100))]
        return LazyVGrid(columns: columns, spacing: 15) {
            ThemeButton(
                icon: Image(systemName: "smiley"),
                text: "Theme 1",
                isDisabled: $isBlueDisabled,
                color: $color,
                action: { changeColor(newColor: .blue) }
            )
            ThemeButton(
                icon: Image(systemName: "shuffle"),
                text: "Theme 2",
                isDisabled: $isRedDisabled,
                color: $color,
                action: { changeColor(newColor: .red) }
            )
            ThemeButton(
                icon: Image(systemName: "heart"),
                text: "Theme 3",
                isDisabled: $isGreenDisabled,
                color: $color,
                action: { changeColor(newColor: .green) }
            )
        }
    }
}

#Preview {
    ContentView()
}
