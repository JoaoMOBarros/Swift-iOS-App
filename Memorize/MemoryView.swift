//
//  ContentView.swift
//  Memorize
//
//  Created by Joao Barros on 23/04/23.
//

import SwiftUI

struct MemoryView: View {
    
   @ObservedObject var controller: MemoryController
    
    @State var emojiSet: Array<String> = []
    @State var selectedTheme: Theme = Theme.transports
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.title)
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(controller.cards){ card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            controller.choose(card)
                        }
                    }
                }
            }.foregroundColor(.red)
            Spacer()
            VStack{
                List{
                    Picker("Theme", selection: $selectedTheme){
                        ForEach(Theme.allCases){ theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                }
                Button("Select Theme"){controller.changeTheme(theme: selectedTheme)}
            }
        }.padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryModel<String>.Card
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 25)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }
            else if card.isMatched{
                shape.opacity(0.2)
            }
            else{
                shape.fill(.red)
            }
        }
    }
}














































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryController()
        MemoryView(controller: game)
    }
}
