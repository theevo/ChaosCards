//
//  DecksListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import SwiftUI
import CoreData

extension DeckEntity {
    convenience init(deck: Deck, moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.name = deck.name
    }
}

struct DecksListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var decks: FetchedResults<DeckEntity>
    
    var body: some View {
        VStack {
            List(decks) { deckEntity in
                Text(deckEntity.name ?? "unknown name")
            }
            Button("Add deck") {
                let _ = DeckEntity(deck: Deck.example, moc: moc)
                try? moc.save()
            }
        }
    }
}

struct DecksListView_Previews: PreviewProvider {
    static var previews: some View {
        DecksListView()
    }
}