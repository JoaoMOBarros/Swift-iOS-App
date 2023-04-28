//
//  MemoryViewModel.swift
//  Memorize
//
//  Created by Joao Barros on 27/04/23.
//

import SwiftUI

class MemoryController: ObservableObject {
    
    static var emojis: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🦁","🦄"]
    
    static func createMemoryGame() -> MemoryModel<String>{
        MemoryModel<String>(numberOfPairsOfCards:4){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryModel<String> = createMemoryGame()
    
    var cards: Array<MemoryModel<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryModel<String>.Card){
        model.choose(card)
    }
    
    func changeTheme(theme: Theme){
        
        var newEmojis: Array<String> {
            switch theme{
            case Theme.transports:
                return ["🚗","🚀","🚤","🚂","✈️","🚁","🛸","🛥"]
            case Theme.animals:
                return ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🦁","🦄"]
            case Theme.countryFlags:
                return ["🇧🇷","🇮🇹","🇩🇪","🇺🇸","🇩🇰","🇯🇵","🇲🇾","🇸🇬","🇧🇳","🇱🇧"]
            }
        }
        
        model = MemoryModel<String>(numberOfPairsOfCards:4){ pairIndex in
            newEmojis[pairIndex]
        }
    }
}
