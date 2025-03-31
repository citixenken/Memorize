//
//  CardView.swift
//  Memorize
//
//  Created by Ken Muyesu on 30/03/2025.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card

    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay(
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
                    .rotationEffect(.degrees(card.isMatched ? 360: 0))
                    .animation(.spin(duration: 1), value: card.isMatched)
            )
            .padding(5)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = MemoryGame<String>.Card
    
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(content: "N", id: "test_1"))
                CardView(Card(isFaceUp: true, content: "Y", id: "test_2"))
                    .aspectRatio(2/3, contentMode: .fit)
            }
            HStack {
                CardView(Card(isMatched: true, content: "N", id: "test_1"))
                CardView(Card(isFaceUp: true, isMatched: true, content: "I must not fear.", id: "test_2"))
            }
            
        }
        .padding()
        .foregroundColor(.orange)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}
