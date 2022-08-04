//
//  ContentView.swift
//  Memorize
//
//  Created by Eduardo Ximenes on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ViewModel: EmojiMemory
    // observer any change ( in view model) and rebuild if something is change
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(ViewModel.cards){card in
                        CardView(card: card)
                                     .aspectRatio(2/3, contentMode: .fit)
                                     .onTapGesture {
                                         ViewModel.choose(card)
                                     }
                   }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
}
struct CardView: View{
    let card: MemoryGame<String>.Card
        
    var body: some View{
        ZStack{
            let shape  = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 5)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemory()
        ContentView(ViewModel: game)
            .preferredColorScheme(.dark)
            ContentView(ViewModel: game)
                .preferredColorScheme(.light)
    }
}
