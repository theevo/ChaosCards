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
    var entities: [DeckEntity] = []
    
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
    
    func loadAllDecks(){
        let fetchRequest = DeckEntity.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "userOrder", ascending: true)
        ]
        do {
            self.entities = try moc.fetch(fetchRequest)
            let decks = entities.map { Deck(deckEntity: $0) }
            self.decks = decks
        } catch {
            print("😫 wah wah", error)
            print(error.localizedDescription)
        }
    }
    
    func add(deck: Deck) {
        let _ = DeckEntity(deck: deck, moc: moc)
        save()
        loadAllDecks()
        print("👀 entities count = ", entities.count)
    }
    
    func delete(deck: Deck) {
        guard let entity = entities.first(where: { entity in
            entity.id?.uuidString == deck.id.uuidString
        }) else { return }
        print("🙅🏻‍♂️ deleting", entity.name ?? "deck with no name", entity.id?.uuidString.suffix(4) ?? "no id?!? what?")
        moc.delete(entity)
        save()
    }
    
    func move(fromOffsets: IndexSet, toOffset: Int) {
        print("/// BEFORE move")
        print(entities.map { $0.name ?? "no name" })
        entities.move(fromOffsets: fromOffsets, toOffset: toOffset)
        print("/// AFTER move")
        print(entities.map { $0.name ?? "no name" })
        decks.move(fromOffsets: fromOffsets, toOffset: toOffset)
        sort()
        print("moc hasChanges? ", moc.hasChanges)
        save()
//        loadAllDecks()
    }
    
    func sort() {
        for (index, entity) in entities.enumerated() {
            entity.userOrder = Int16(index)
        }
    }
    
    func save() {
        try? moc.save()
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
