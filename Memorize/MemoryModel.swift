//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Joao Barros on 27/04/23.
//

import Foundation

struct MemoryModel<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    var indexOfFacedUpCard: Int? = nil
    var score: Int = 0
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatch = indexOfFacedUpCard {
                if cards[potentialMatch].content == cards[chosenIndex].content{
                    cards[potentialMatch].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score += 2
                }
                else{
                    score -= 1
                }
                indexOfFacedUpCard = nil
            }
            else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfFacedUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        return 0 // #TODO: (joaomarco@) need to handle this better
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
