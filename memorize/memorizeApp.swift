//
//  memorizeApp.swift
//  memorize
//
//  Created by allan galdino on 17/01/22.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
