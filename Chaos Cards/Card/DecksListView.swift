//
//  DecksListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import SwiftUI

struct DecksListView: View {
    @FetchRequest(sortDescriptors: []) private var deckEntities: FetchedResults<DeckEntity>
    @State var activeDeck = ""
    var deckManager: DeckManager
    
    var decks: [Deck] {
        deckEntities.map { Deck(deckEntity: $0) }
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
            let deckEntity = deckEntities[offset]
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
            .environment(\.managedObjectContext, PersistentContainer.previewMoc)
    }
}
