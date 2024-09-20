//
//  ContentView.swift
//  Memorize
//
//  Created by Marco Trivisonno on 18/09/24.
//

import SwiftUI

struct EmojiMemoryGameContentView: View {
    // Redraw the UI if something is changes in the viewModel.
    // Only what is changes is rebuilt.
    // The lifetime of the viewModel is equal to the lifetime of the passed object.
    @ObservedObject var viewModel : EmojiMemoryGame

    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [
            GridItem(
                .adaptive(minimum: 85),
                // vertically spacing
                spacing: 0
            )
        ],
                  spacing: 0,
                  content: {
            ForEach(viewModel.cards) { card in
                CardView(
                    card
                )
                .aspectRatio(2/3, contentMode: .fit)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
            }
        }
        )        .foregroundColor(.orange)

    }
}

// This is recreted every times something changes. No property wrappers are needed.
#Preview {
    EmojiMemoryGameContentView(viewModel: EmojiMemoryGame())
}

