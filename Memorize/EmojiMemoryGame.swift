//
//  EmojiMemoryGame.swift
//  Memorize
//  This is the ViewModel. It binds Model to View.
//  Created by Marco Trivisonno on 18/09/24.
//

import SwiftUI


// It is a class because it is shared.
class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "😈", "🍔", "🎾", "🚘", "⚠️", "✈️"]
    
    private static func createEmojiContent(forPairAtIndex index: Int) -> String {
        ["👻", "🎃", "😈", "🍔", "🎾", "🚘", "⚠️", "✈️"][index]
   }
     
    // When the model changes, something is changed.
     @Published private var model = MemoryGame<String>(
        numberOfPairsOfCards: min(6, emojis.count - 1),
        cardContentFactory: createEmojiContent
     )
    
    // with closure
//    private var model = MemoryGame(
//        numberOfPairsOfCards: 4,
//        cardContentFactory: { (index: Int) -> String in
//            EmojiMemoryGame.emojis[index]
//       }
//    )
    
    // semplify closure.
    // It knows that the close returns a String, and index is a Int.
//    private var model = MemoryGame(
//        numberOfPairsOfCards: 4,
//        cardContentFactory: { index in
//            EmojiMemoryGame.emojis[index]
//       }
//    )
    
    // Because it is a closure, we can remove the name and open the '{' to define the closure body.
//    private var model = MemoryGame(
//        numberOfPairsOfCards: 4
//        ) { index in
//            EmojiMemoryGame.emojis[index]
//       }

    
    var cards : [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intents
    
    // Card is only an internal parameter
    func choose(_ card : MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
