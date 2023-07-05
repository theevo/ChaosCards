//
//  DecksListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import SwiftUI

struct DecksListView: View {
    @StateObject var deckManager: DeckManager
    
    var decks: [Deck] {
        deckManager.decks
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Active Deck") {
                    Text(deckManager.activeDeckName)
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
                            .onLongPressGesture(minimumDuration: 2.5) {
                                rename(deck: deck)
                            }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                } header: {
                    Text("All decks")
                } footer: {
                    Text("Tap a deck to set the active deck.")
                }
                Button("Add deck") {
                    deckManager.add(deck: Deck.smallExample)
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func activate(deck: Deck) {
        deckManager.set(activeDeckId: deck.id.uuidString)
    }
    
    func delete(at offsets: IndexSet) {
        for offset in offsets {
            let deck = decks[offset]
            deckManager.delete(deck: deck)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
//        deckManager.decks.move(fromOffsets: source, toOffset: destination)
        deckManager.move(fromOffsets: source, toOffset: destination)
    }
    
    func rename(deck: Deck) {
        print("rename")
    }
}

struct DecksListView_Previews: PreviewProvider {
    static var previews: some View {
        DecksListView(deckManager: DeckManager.mock)
    }
}
