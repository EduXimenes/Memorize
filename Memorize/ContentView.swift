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
    @State var emojiCount = 16
    
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
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
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
