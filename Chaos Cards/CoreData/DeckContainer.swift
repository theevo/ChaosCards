//
//  DeckContainer.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import CoreData

class DeckContainer {
    let persistentContainer: NSPersistentContainer
    
    init(forPreview: Bool = false) {
        self.persistentContainer = NSPersistentContainer(name: "ChaosCards")
        
        if forPreview {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { _, _ in
        }
        
        if forPreview {
            addMockData(context: persistentContainer.viewContext)
        }
    }
}

extension DeckContainer {
    func addMockData(context moc: NSManagedObjectContext) {
        let deckEntity1 = DeckEntity(deck: Deck.example, moc: moc)
        let deckEntity2 = DeckEntity(deck: Deck.smallExample, moc: moc)
        try? moc.save()
    }
}
