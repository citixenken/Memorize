//
//  ContentView.swift
//  Memorize
//
//  Created by Ken Muyesu on 11/09/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🙆🏿‍♂️", "🎯", "🤯", "🧠", "👨🏿‍🍼", "🙆🏿‍♂️", "🎯", "🤯", "🧠", "👨🏿‍🍼"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.teal)
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
