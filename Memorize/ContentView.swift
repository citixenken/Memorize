//
//  ContentView.swift
//  Memorize
//
//  Created by Ken Muyesu on 11/09/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🙆🏿‍♂️", "🎯", "🤯", "🧠", "👨🏿‍🍼", "🙆🏿‍♂️", "🎯", "🤯", "🧠", "👨🏿‍🍼"]
    
    @State var cardCount: Int = 4

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.mint)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            
            Spacer()
            
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let rr = RoundedRectangle(cornerRadius: 12)
            
            Group {
                rr.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            rr.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
