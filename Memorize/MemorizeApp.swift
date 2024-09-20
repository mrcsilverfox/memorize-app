//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Marco Trivisonno on 18/09/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // Here at the top level, we should use @StateObject.
    // It exists when the View comes on, and when the View is no longer
    // in the body of some view, it's just taken away.
    // In this case, the lifetime of the game, is the entire app life.
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameContentView(viewModel: game)
        }
    }
}
