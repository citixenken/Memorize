//
//  ContentView.swift
//  Memorize
//
//  Created by Ken Muyesu on 11/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.mint)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            var rr = RoundedRectangle(cornerRadius: 16)
            
            if isFaceUp {
                rr.strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            } else {
                rr
            }
        }
    }
}

#Preview {
    ContentView()
}
