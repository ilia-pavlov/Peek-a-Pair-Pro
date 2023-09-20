//
//  MemoryGameViewModel.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 8/22/23.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    typealias Card = MemoryGameModel<String>.Card
    
    /// `static` will solve follow issues
    ///  `Cannot use instance member 'emojis' within property initializer; property initializers run before 'self' is available`
    private static let emojis = ["✈️", "🚗", "🛳️", "🚆", "🚌",
                  "🚁", "🚲", "🛴", "🚀", "🛵",
                  "🚢", "🏍️", "🚂", "🚇", "🛶",
                  "🚤", "🚍", "🏎️", "🛹", "🛸",
                  "🛻", "🚟", "🚠", "🚝", "🚄"]
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        .init(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    /// `private`- protect model to be reachable from View
    /// `private(set)` - allow to see the value but protect value been changed
    @Published private var model = createMemoryGame()
    
    var cards: [Card] { model.cards }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        /// objectWillChange.send() - invisible object works under the sense since since we added @Published
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
