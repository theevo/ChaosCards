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
//            .onChange(of: deckManager) { newViewModel in
//                let id = newViewModel.activeDeckIdString
//                print("🐷 new id = ", id)
//            }
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
                print("add a deck")
//                let _ = DeckEntity(deck: Deck.example, moc: moc)
//                try? moc.save()
            }
        }
        .onAppear {
            let id = deckManager.activeDeckIdString
            guard id.count > 0,
                  let deck = decks.first(where: { $0.id.uuidString == id })
            else { return }
            activeDeck = deck.name
            print("✅ this deck is active:", activeDeck)
        }
    }
    
    func activate(deck: Deck) {
        deckManager.set(activeDeckId: deck.id.uuidString)
        
        activeDeck = deck.name
    }
    
    func delete(at offsets: IndexSet) {
        for offset in offsets {
//            let deckEntity = deckEntities[offset]
//            moc.delete(deckEntity)
            print("Delete deck")
        }
        do {
//            try moc.save()
            print("save moc")
        } catch {
            print("error saving: \(error.localizedDescription)")
        }
    }
}

struct DecksListView_Previews: PreviewProvider {
    static var previews: some View {
        DecksListView(deckManager: DeckManager.mock)
            .environment(\.managedObjectContext, PersistentContainer.previewMock.moc)
    }
}
