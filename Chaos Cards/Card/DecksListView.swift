//
//  DecksListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import SwiftUI

struct DecksListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var deckEntities: FetchedResults<DeckEntity>
    @State var activeDeck = ""
    @StateObject var deckListViewModel = DeckListViewModel()
    
    var body: some View {
        Form {
            Section("Active Deck") {
                Text(activeDeck)
            }
//            .onChange(of: deckListViewModel) { newViewModel in
//                let id = newViewModel.activeDeckIdString
//                print("🐷 new id = ", id)
//            }
            Section {
                List() {
                    ForEach(deckEntities) { deckEntity in
                        let deck = Deck(deckEntity: deckEntity)
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
                let _ = DeckEntity(deck: Deck.example, moc: moc)
                try? moc.save()
            }
        }
        .onAppear {
            let id = deckListViewModel.activeDeckIdString
            guard id.count > 0,
                  let entity = deckEntities.first(where: { $0.id?.uuidString == id }),
                  let name = entity.name
            else { return }
            activeDeck = name
            print("✅ this deck is active:", activeDeck)
        }
    }
    
    func activate(deck: Deck) {
        let defaults = UserDefaults.standard
        defaults.set(deck.id.uuidString, forKey: "ActiveDeck")
        activeDeck = deck.name
        
        print("💾 saved", deck.id.uuidString.suffix(4))
        
//        guard let id = defaults.string(forKey: "ActiveDeck") else { return }
//        print("👉 load deck id: ", id)
    }
    
    func delete(at offsets: IndexSet) {
        for offset in offsets {
            let deckEntity = deckEntities[offset]
            moc.delete(deckEntity)
        }
        do {
            try moc.save()
        } catch {
            print("error saving: \(error.localizedDescription)")
        }
    }
}

struct DecksListView_Previews: PreviewProvider {
    static var previews: some View {
        DecksListView()
            .environment(\.managedObjectContext, PersistentContainer.previewMoc)
    }
}
