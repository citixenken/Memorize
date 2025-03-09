//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ken Muyesu on 09/03/2025.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
