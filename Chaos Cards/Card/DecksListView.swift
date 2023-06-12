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
    
    var body: some View {
        Form {
            Section("Active Deck") {
                Text(activeDeck)
            }
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
                            activeDeck = deck.name
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
            .environment(\.managedObjectContext, DeckContainer.previewMoc)
    }
}
