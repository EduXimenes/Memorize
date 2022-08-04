//
//  EmojiMemory.swift
//  Memorize
//
//  Created by Eduardo Ximenes on 25/07/22.
//

import SwiftUI
// This is our View Model
class EmojiMemory: ObservableObject {
     
    static let emojis = ["🦖", "🐥", "🪲", "🐔","🐸", "🐵", "🐧", "🦆", "🦉", "🐝", "🐙", "🐼","🐶", "🐹", "🦇", "🐌", "🐜", "🦐", "🐖", "🦥", "🐞", "🐨",
        "🦁", "🦗", "🕷", "🦂", "🐳", "🦒", "🦧", "🐲", "🦩", "🕊", "🐕", "🦞",]
    
    static func createMemoryGame() -> MemoryGame<String> {
            MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
                emojis[pairIndex]}
        }
    @Published private var model: MemoryGame<String> = createMemoryGame()
        // Informs that something is changed and need to be rebuilt
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
