//
//  MemoryGame.swift
//  Memorize
//  This is the Model.
//  Created by Marco Trivisonno on 18/09/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    // Set in private, so cards are not editable from outside.
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard : Int?
    
    var indexOf : Int? {
        get {
            return cards.indices.filter({index in cards[index].isFaceUp}).only
        }
        set {
            
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(of: card) {
            if (!cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched) {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if (cards[chosenIndex].content == cards[potentialMatchIndex].content) {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    indexOfTheOneAndOnlyFaceUpCard = nil
                } else {
                    // This logic can be moved inside the indexOfTheOneAndOnlyFaceUpCard (aka) indexOf setter
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    // Is good to nested structs, so it is in the same scope of MemoryGame.
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id : String
        var debugDescription: String {
            "Card(id: \(id), content: \(content))"
        }
    }
}

extension  Array {
    /// Return the first item of the Array or nil.
    var only : Element? {
        count == 1 ? first : nil
    }
}
