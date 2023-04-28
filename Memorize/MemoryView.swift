//
//  ContentView.swift
//  Memorize
//
//  Created by Joao Barros on 23/04/23.
//

import SwiftUI

struct MemoryView: View {
//    let transports: Array<String> = ["🚗","🚀","🚤","🚂","✈️","🚁","🛸","🛥"]
//    let flags: Array<String> = ["🇧🇷","🇮🇹","🇩🇪","🇺🇸","🇩🇰","🇯🇵","🇲🇾","🇸🇬","🇧🇳","🇱🇧"]
//    let animals: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🦁","🦄"]
    
   @ObservedObject var controller: MemoryController
    
    @State var selectedTheme: String = "Transports"
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.title)
            Spacer()
            HStack{
                Spacer()
                Text(controller.getName())
                    .font(.subheadline)
                Spacer()
                Text("Score: \(controller.getScore())")
                    .font(.subheadline)
                Spacer()

            }
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(controller.cards){ card in
                        CardView(card: card, color: controller.themeColor).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            controller.choose(card)
                        }
                    }
                }
            }.foregroundColor(controller.themeColor)
            Spacer()
            VStack{
                List{
                    Picker("Theme", selection: $selectedTheme){
                        ForEach(ThemesSupported.allCases){ theme in
                            Text(theme.rawValue).tag(theme.rawValue)
                        }
                    }
                }.cornerRadius(25)
                .padding()
                .frame(height: 145.0)
                HStack{
                    Spacer()
                    Button("Select Theme"){controller.changeTheme(theme: selectedTheme)}
                    Spacer()
                    Button("New Game"){controller.newGame()}
                    Spacer()
                }
            }
        }.padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryModel<String>.Card
    let color: Color
    
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
                shape.fill(color)
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
