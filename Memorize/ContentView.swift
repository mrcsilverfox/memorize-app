//
//  ContentView.swift
//  Memorize
//
//  Created by Marco Trivisonno on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount : Int = 4
    // or [String] or Array<String>
    let emojis = ["👻", "🎃", "😈", "🍔", "🎾", "🚘", "⚠️", "✈️",]
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
    
    // by is the external parameter, offset is the internal parameter.
    func cardCountAjuster(by offset: Int, symbol: String) -> some View {
        Button(
            action: {
                    cardCount += offset
            },
            label: {
                Image(systemName: symbol)
            }
        )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill"
        )
    }
    
    var cardAdder: some View {
        cardCountAjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill"
        )
    }
    
    var cardCountAdjusters : some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(
                    content: emojis[index],
                    isFaceUp: true
                )
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        )        .foregroundColor(.orange)

    }
}

#Preview {
    ContentView()
}

