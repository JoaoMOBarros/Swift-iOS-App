//
//  MemoryViewModel.swift
//  Memorize
//
//  Created by Joao Barros on 27/04/23.
//

import SwiftUI

class MemoryController {
    
    static let emojis: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🦁","🦄"]
    
    static func createMemoryGame() -> MemoryModel<String>{
        MemoryModel<String>(numberOfPairsOfCards:4){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryModel<String> = createMemoryGame()
    
    var cards: Array<MemoryModel<String>.Card>{
        return model.cards
    }
}
