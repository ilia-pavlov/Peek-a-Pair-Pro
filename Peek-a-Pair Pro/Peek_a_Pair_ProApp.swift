//
//  Peek_a_Pair_ProApp.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 8/17/23.
//

import SwiftUI

@main
struct Peek_a_Pair_ProApp: App {
    /// free init from class allows to initialize with empty brakes
    /// `game` are pointer to `MemoryGameViewModel()`
    private let game: MemoryGameViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameViewModel: game)
        }
    }
}
