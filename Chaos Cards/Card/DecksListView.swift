//
//  DecksListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import SwiftUI

struct DecksListView: View {
    @StateObject var deckManager: DeckManager
    @State var activeDeck = ""
    
    var decks: [Deck] {
        deckManager.decks
    }
    
    var body: some View {
        Form {
            Section("Active Deck") {
                Text(activeDeck)
            }
            Section {
                List() {
                    ForEach(decks) { deck in
                        HStack {
                            Text(deck.name)
                                .badge(deck.cards.count)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            activate(deck: deck)
                        }
                    }
                    .onDelete(perform: delete)
                }
            } header: {
                Text("All decks")
            } footer: {
                Text("Tap a deck to set it active. Long press to rename it.")
            }
            Button("Add deck") {
                deckManager.add(deck: Deck.example)
            }
        }
        .onAppear {
            activeDeck = deckManager.activeDeckName
            print("✅ this deck is active:", activeDeck)
        }
    }
    
    func activate(deck: Deck) {
        deckManager.set(activeDeckId: deck.id.uuidString)
        
        activeDeck = deck.name
    }
    
    func delete(at offsets: IndexSet) {
        for offset in offsets {
            let deck = decks[offset]
            deckManager.delete(deck: deck)
        }
    }
}

struct DecksListView_Previews: PreviewProvider {
    static var previews: some View {
        DecksListView(deckManager: DeckManager.mock)
    }
}
