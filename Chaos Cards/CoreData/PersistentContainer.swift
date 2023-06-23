//
//  PersistentContainer.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import CoreData

class PersistentContainer {
    let persistentContainer: NSPersistentContainer
    var decks: [Deck] = []
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init(forPreview: Bool = false) {
        self.persistentContainer = NSPersistentContainer(name: "ChaosCards")
        
        if forPreview {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { _, _ in
        }
        loadAllDecks()
    }
    
    func load(deckId: String) {
        print("👉 load deck id: ", deckId.suffix(4))
    }
    
    func loadAllDecks(){
        let fetchRequest = DeckEntity.fetchRequest()
        do {
            let entities = try moc.fetch(fetchRequest)
            let decks = entities.map { Deck(deckEntity: $0) }
            self.decks = decks
        } catch {
            print("😫 wah wah", error)
            print(error.localizedDescription)
        }
    }
}

extension PersistentContainer {
    static var previewMock: PersistentContainer {
        let persistentContainer = PersistentContainer(forPreview: true)
        addMockData(moc: persistentContainer.moc)
        return persistentContainer
    }
    
    static func addMockData(moc: NSManagedObjectContext) {
        let _ = DeckEntity(deck: Deck.example, moc: moc)
        let _ = DeckEntity(deck: Deck.smallExample, moc: moc)
        try? moc.save()
    }
}
