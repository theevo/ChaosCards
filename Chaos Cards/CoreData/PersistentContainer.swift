//
//  PersistentContainer.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import CoreData

class PersistentContainer {
    let persistentContainer: NSPersistentContainer
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "ChaosCards")
        persistentContainer.loadPersistentStores { _, _ in
        }
        loadAllDecks()
    }
    
    func load(deckId: String) {
        print("👉 load deck id: ", deckId.suffix(4))
    }
    
    func loadAllDecks() {
        let fetchRequest = DeckEntity.fetchRequest()
        do {
            let entities = try moc.fetch(fetchRequest)
            let decks = entities.map { Deck(deckEntity: $0) }
            print("😇 All decks:", decks)
        } catch {
            print("😫 wah wah", error)
        }
    }
}

extension PersistentContainer {
    static var previewMoc: NSManagedObjectContext {
        let persistentContainer = NSPersistentContainer(name: "ChaosCards")
        persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        persistentContainer.loadPersistentStores { _, _ in }
        addMockData(moc: persistentContainer.viewContext)
        return persistentContainer.viewContext
    }
    
    static func addMockData(moc: NSManagedObjectContext) {
        let _ = DeckEntity(deck: Deck.example, moc: moc)
        let _ = DeckEntity(deck: Deck.smallExample, moc: moc)
        try? moc.save()
    }
}
