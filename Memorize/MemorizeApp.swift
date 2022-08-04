//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Eduardo Ximenes on 23/07/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemory()
    
    var body: some Scene {
        WindowGroup {
            ContentView(ViewModel: game)
        }
    }
}


