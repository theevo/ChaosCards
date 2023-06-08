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
    }
}

extension DeckContainer {
    static let previewContainer = DeckContainer(forPreview: true)
    
    static var previewMoc: NSManagedObjectContext {
        previewContainer.addMockData()
        return previewContainer.persistentContainer.viewContext
    }
    
    func addMockData() {
        let moc = persistentContainer.viewContext
        let _ = DeckEntity(deck: Deck.example, moc: moc)
        let _ = DeckEntity(deck: Deck.smallExample, moc: moc)
        try? moc.save()
    }
}
