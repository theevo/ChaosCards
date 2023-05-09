//
//  CardListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

struct CardListView: View {
    let deck: Deck
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(deck.cards) { card in
                        NavigationLink(value: card) {
                            CardView(card: card)
                        }
                    }
                }
            }
            .navigationTitle(deck.name)
            .navigationDestination(for: Card.self) { card in
                EditCardView(card: card)
                    .toolbarRole(.editor)
            }
            .toolbar {
                NavigationLink("Settings") {
                    SettingsView()
                        .toolbarRole(.editor)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(deck: Deck.example)
    }
}
