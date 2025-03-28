//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ken Muyesu on 09/03/2025.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🙆🏿‍♂️", "🎯", "🤯", "🧠", "👨🏿‍🍼", "🤯", "🧠", "👨🏿‍🍼"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 9) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❌"
            }
        }
    }
        
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
