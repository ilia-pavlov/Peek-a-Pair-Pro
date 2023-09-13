//
//  ContentView.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 8/17/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: MemoryGameViewModel
    
    var body: some View {
        AspectVGrid(items: gameViewModel.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card)
                    .padding(4)
                    .onTapGesture {
                        gameViewModel.choose(card)
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    private let card: MemoryGameViewModel.Card
    
    init(_ card: MemoryGameViewModel.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape // .fill() by default
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game: MemoryGameViewModel = .init()
        EmojiMemoryGameView(gameViewModel: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(gameViewModel: game)
            .preferredColorScheme(.light)
    }
}
