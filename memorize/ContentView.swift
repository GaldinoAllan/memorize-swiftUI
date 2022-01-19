//
//  ContentView.swift
//  memorize
//
//  Created by allan galdino on 17/01/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚀", "🚓", "🚕", "🚗", "🚁", "🚂", "🚡", "⛵️", "🛵", "🚆", "🚲", "🚉", "🚋", "🚌", "🚒", "🚑", "🚙", "🚚", "🚛", "🚜", "🏎", "🏍", "🛩", "🛴"]

    @State var emojiCount = 6

    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { CardView(content: $0) }
            }
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
    }

    var removeButton: some View {
        Button {
            guard emojiCount > 1 else { return }
            emojiCount -= 1
        } label: {
            Image(systemName: "minus.circle")
        }
    }

    var addButton: some View {
        Button {
            guard emojiCount < emojis.count else { return }
            emojiCount += 1
        } label: {
            Image(systemName: "plus.circle")
        }

    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 8)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            flipCard()
        }
    }

    func flipCard() {
        isFaceUp = !isFaceUp
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
    }
}
