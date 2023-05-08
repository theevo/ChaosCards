//
//  CardListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

struct CardListView: View {
    let cards: [Card]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(cards) { card in
                        NavigationLink(value: card) {
                            CardView(card: card)
                        }
                    }
                }
            }
            .navigationTitle("🇹🇭 days of the week")
            .navigationDestination(for: Card.self) { card in
                EditCardView(card: card)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(cards: Card.manySampleCards)
    }
}
