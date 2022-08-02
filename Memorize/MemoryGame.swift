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
    
    mutating func choose(_ card: Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("Chosen Card: \(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }
    
    //initializing the cards var using init
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    //creating a struct of a Card, wich contains the necessary variables to build the funcionality 
    struct Card: Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
