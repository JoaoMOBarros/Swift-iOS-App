//
//  ContentView.swift
//  Memorize
//
//  Created by Joao Barros on 23/04/23.
//

import SwiftUI

struct ContentView: View {
    let transports: Array<String> = ["🚗","🚀","🚤","🚂","✈️","🚁","🛸","🛥"]
    let flags: Array<String> = ["🇧🇷","🇮🇹","🇩🇪","🇺🇸","🇩🇰","🇯🇵","🇲🇾","🇸🇬","🇧🇳","🇱🇧"]
    let animals: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🦁","🦄"]
    
    @State var emojiSet: Array<String> = [];
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.title)
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojiSet, id: \.self){ emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                Spacer()
                Button(action: {self.emojiSet = self.transports.shuffled()}, label: {
                    VStack{
                        Image(systemName: "car.fill")
                        Text("Transports")
                            .font(.footnote)
                    }
                })
                Spacer()
                Button(action: {self.emojiSet = self.flags.shuffled()}, label: {
                    VStack{
                        Image(systemName: "flag.fill")
                        Text("Flags")
                            .font(.footnote)
                    }
                })
                Spacer()
                Button(action: {self.emojiSet = self.animals.shuffled()}, label: {
                    VStack{
                        Image(systemName: "bird.fill")
                        Text("Animals")
                            .font(.footnote)
                    }
                })
                Spacer()
            }.padding(.horizontal).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
        }.padding(.all)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true;
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else{
                shape.fill(.red)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
















































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
