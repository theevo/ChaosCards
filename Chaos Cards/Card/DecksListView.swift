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

extension Deck {
    init(deckEntity: DeckEntity) {
        let name = deckEntity.name ?? "<unknown name>"
        self.init(name: name, cards: [])
    }
}

struct DecksListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var deckEntities: FetchedResults<DeckEntity>
    
    var body: some View {
        VStack {
            List(deckEntities) { deckEntity in
                let deck = Deck(deckEntity: deckEntity)
                Text(deck.name)
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
            .environment(\.managedObjectContext, DeckContainer(forPreview: true).persistentContainer.viewContext)
    }
}
