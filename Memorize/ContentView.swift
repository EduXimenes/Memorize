//
//  ContentView.swift
//  Memorize
//
//  Created by Eduardo Ximenes on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["🦖", "🐥", "🪲", "🐔","🐸", "🐵", "🐧", "🦆", "🦉", "🐝", "🐙", "🐼","🐶", "🐹", "🦇", "🐌", "🐜", "🦐", "🐖", "🦥", "🐞", "🐨",
        "🦁", "🦗", "🕷", "🦂", "🐳", "🦒", "🦧", "🐲", "🦩", "🕊", "🐕", "🦞",]
    // Podemos também declarar como : [String] que seria mesma coisa que Array<String>
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                             ForEach(emojis[0..<emojiCount], id: \.self){emoji in
                                 CardView(content: emoji)
                                     .aspectRatio(2/3, contentMode: .fit)
                             }
                        }
            }
            Spacer()
            HStack{
                    removeCard
                    Spacer()
                    addCard
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
    var removeCard: some View{
        Button {
            if emojiCount > 2{
                emojiCount-=1
            }
        } label: {
            Image(systemName: "minus.square")
            }
        }
    var addCard: some View{
        Button {
            if emojiCount < emojis.count{
                emojiCount+=1
            }
        } label: {
                Image(systemName: "plus.square")
            }
    }
}
struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let shape  = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 5)
            Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
    }
}
