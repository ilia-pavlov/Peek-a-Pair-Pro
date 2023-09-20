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
        VStack {
            gameBody
            shuffle
        }
        .padding()
    }
    
    var gameBody: some View {
        AspectVGrid(items: gameViewModel.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
//              VS do Rectangle().opacity(0) we can use Color.clear
                Color.clear
            } else {
                CardView(card)
                    .padding(4)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 3)) {
                            gameViewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
    }
    
    var shuffle: some View {
//        CustomButton(buttonName: "Shuffle", buttonImage: "shuffle") {
//            gameViewModel.shuffle()
//        }
        Button("Shuffle") {
            withAnimation {
                gameViewModel.shuffle()
            }
        }
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
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5)
                    .opacity(0.6)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }

    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.65
        static let fontSize: CGFloat = 32
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game: MemoryGameViewModel = .init()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(gameViewModel: game)
    }
}
