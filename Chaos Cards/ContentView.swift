//
//  ContentView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    let cards: [Card]
    var body: some View {
        ScrollView {
            VStack {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: Card.manySampleCards)
    }
}
