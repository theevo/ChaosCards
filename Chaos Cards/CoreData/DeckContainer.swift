//
//  DeckContainer.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/7/23.
//

import CoreData

class DeckContainer {
    let persistentContainer: NSPersistentContainer
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "ChaosCards")
        persistentContainer.loadPersistentStores { _, _ in
        }
    }
}
