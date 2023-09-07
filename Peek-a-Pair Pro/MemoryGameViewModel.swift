//
//  MemoryGameViewModel.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 8/22/23.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    /// `static` will solve follow issues
    ///  `Cannot use instance member 'emojis' within property initializer; property initializers run before 'self' is available`
    static let emojis = ["✈️", "🚗", "🛳️", "🚆", "🚌",
                  "🚁", "🚲", "🛴", "🚀", "🛵",
                  "🚢", "🏍️", "🚂", "🚇", "🛶",
                  "🚤", "🚍", "🏎️", "🛹", "🛸",
                  "🛻", "🚟", "🚠", "🚝", "🚄"]
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        .init(numberOfPairsOfCards: 5) { pairIndex in emojis[pairIndex] }
    }
    
    /// `private`- protect model to be reachable from View
    /// `private(set)` - allow to see the value but protect value been changed
    @Published private var model: MemoryGameModel<String> = createMemoryGame()
    
    var cards: [MemoryGameModel<String>.Card] { model.cards }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
}
