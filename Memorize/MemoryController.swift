//
//  MemoryViewModel.swift
//  Memorize
//
//  Created by Joao Barros on 27/04/23.
//

import SwiftUI

class MemoryController: ObservableObject {
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Animals",
            set: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🦁","🦄"],
            pairs: 12,
            color: "red"),
        Theme(
            name: "Transports",
            set: ["🚗","🚀","🚤","🚂","✈️","🚁","🛸","🛥"],
            pairs: 99,
            color: "blue"),
        Theme(
            name: "Flags",
            set: ["🇧🇷","🇮🇹","🇩🇪","🇺🇸","🇩🇰","🇯🇵","🇲🇾","🇸🇬","🇧🇳","🇱🇧"],
            pairs: 6,
            color: "green")
    ]
    
    static var selectedTheme: Theme = themes.randomElement()!
    
    static func createMemoryGame() -> MemoryModel<String>{
        MemoryModel<String>(numberOfPairsOfCards: MemoryController.selectedTheme.pairs >= MemoryController.selectedTheme.set.count ? MemoryController.selectedTheme.set.count : MemoryController.selectedTheme.pairs){ pairIndex in
            selectedTheme.set[pairIndex]
        }
    }
    
    var themeColor: Color{
        switch MemoryController.selectedTheme.color{
        case "red":
            return .red
        case "blue":
            return .blue
        case "greem":
            return .green
        default:
            return .yellow
        }
    }
    
    @Published private var model: MemoryModel<String> = createMemoryGame()
    
    var cards: Array<MemoryModel<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryModel<String>.Card){
        model.choose(card)
    }
    
    func changeTheme(theme: String){
        var chosenTheme: Theme {
            switch theme{
                case "Animals":
                return MemoryController.themes[0]
                case "Transports":
                return MemoryController.themes[1]
                case "Flags":
                return MemoryController.themes[2]
            default:
                return MemoryController.themes[0]
            }
        }
        
        MemoryController.selectedTheme = chosenTheme
        
        model = MemoryModel<String>(numberOfPairsOfCards: MemoryController.selectedTheme.pairs >= MemoryController.selectedTheme.set.count ? MemoryController.selectedTheme.set.count : MemoryController.selectedTheme.pairs){ pairIndex in
            MemoryController.selectedTheme.set[pairIndex]
        }
    }
    
    func newGame(){
        changeTheme(theme: MemoryController.themes.randomElement()!.name)
    }
    
    func getName() -> String{
        return MemoryController.selectedTheme.name
    }
    
    func getScore() -> Int{
        return model.score
    }
    
}
