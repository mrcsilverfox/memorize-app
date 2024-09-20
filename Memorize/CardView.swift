//
//  CardView.swift
//  Memorize
//
//  Created by Marco Trivisonno on 18/09/24.
//

import SwiftUI

// Views are read-only.
struct CardView: View {
    let card: MemoryGame<String>.Card
        
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            // local variable in @ViewBuilder
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4)
                Text(card.content)
                    .font(.system(size: 200))
                    // if the font is to big, scale it down to 1/100 of its size.
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)   
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
