//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ken Muyesu on 11/09/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.easeOut, value: viewModel.cards)
            }
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        // MARK: - height issue here!
        .frame(height: 700)
        .foregroundColor(.teal)
    }
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack {
                let rr = RoundedRectangle(cornerRadius: 12)
                
                Group {
                    rr.strokeBorder(lineWidth: 2)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1 : 0)
                rr.fill().opacity(card.isFaceUp ? 0 : 1)
            }
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
