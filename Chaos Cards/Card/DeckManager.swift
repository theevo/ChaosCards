//
//  DeckManager.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/17/23.
//

import Foundation

class DeckManager: ObservableObject {
    @Published var activeDeckName: String = ""
    @Published var decks: [Deck] = []
    @Published var activeDeck: Deck?
    let persistentContainer = PersistentContainer()
    
    init() {
        loadAllDecks()
        getActiveDeckId()
    }
}
    
// MARK: - Public methods
extension DeckManager {
    public func set(activeDeckId: String) {
        // Save to UserDefaults
        let defaults = UserDefaults.standard
        defaults.set(activeDeckId, forKey: "ActiveDeck")
        
        load(id: activeDeckId)
    }
    
    public func add(deck: Deck) {
        persistentContainer.add(deck: deck)
        loadAllDecks()
    }
    
    public func delete(deck: Deck) {
        persistentContainer.delete(deck: deck)
    }
}

// MARK: - Private methods
extension DeckManager {
    private func loadAllDecks() {
        decks = persistentContainer.decks
    }
    
    private func getActiveDeckId() {
        // Get from UserDefaults
        let defaults = UserDefaults.standard
        guard let id = defaults.string(forKey: "ActiveDeck") else { return }
        
        load(id: id)
    }
    
    private func load(id: String) {
        activeDeck = decks.first(where: { deck in
            deck.id.uuidString == id
        })
        activeDeckName = activeDeck?.name ?? ""
    }
}

extension DeckManager {
    static var mock: DeckManager = {
        let deckManager = DeckManager()
        deckManager.decks = [Deck.smallExample, Deck.example]
        return deckManager
    }()
}
