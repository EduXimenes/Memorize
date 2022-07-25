//
//  MemoryGame.swift
//  Memorize
//
//  Created by Eduardo Ximenes on 25/07/22.
//

import Foundation

struct MemoryGame<CardContent> {
    //Making a private set on cards, we just can access and not change this, only for func choose
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        
    }
    //initializing the cards var using init
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    //creating a struct of a Card, wich contains the necessary variables to build the funcionality 
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
