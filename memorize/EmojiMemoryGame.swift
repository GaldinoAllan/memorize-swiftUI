//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Allan Gazola Galdino on 25/01/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🚀", "🚓", "🚕", "🚗", "🚁", "🚂", "🚡", "⛵️", "🛵", "🚆", "🚲", "🚉", "🚋", "🚌", "🚒", "🚑", "🚙", "🚚", "🚛", "🚜", "🏎", "🏍", "🛩", "🛴"]

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published private var model = createMemoryGame()

    var cards: [Card] {
        return model.cards
    }

    // MARK: - Intents

    func choose(_ card: Card) {
        model.choose(card)
    }
}
