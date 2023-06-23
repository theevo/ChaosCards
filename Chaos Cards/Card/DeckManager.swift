//
//  DeckManager.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/17/23.
//

import Foundation

class DeckManager: ObservableObject {
    @Published var activeDeckIdString: String = ""
    @Published var decks: [Deck] = []
    let persistentContainer = PersistentContainer()
    
    init() {
        let defaults = UserDefaults.standard
        guard let id = defaults.string(forKey: "ActiveDeck") else { return }
        self.activeDeckIdString = id
        loadAllDecks()
//        load(id: id)
    }
    
    func loadAllDecks() {
        decks = persistentContainer.decks
        print("😎 all decks:", decks)
    }
    
//    func load(id: String) {
//        persistentContainer.load(deckId: id)
//    }
    
    func set(activeDeckId: String) {
        activeDeckIdString = activeDeckId
        let defaults = UserDefaults.standard
        defaults.set(activeDeckId, forKey: "ActiveDeck")
        print("💾 saved", activeDeckId.suffix(4))
    }
}

extension DeckManager: Equatable {
    static func == (lhs: DeckManager, rhs: DeckManager) -> Bool {
        lhs.activeDeckIdString == rhs.activeDeckIdString
    }
}

extension DeckManager {
    static var mock: DeckManager = {
        let deckManager = DeckManager()
        deckManager.decks = [Deck.smallExample, Deck.example]
        return deckManager
    }()
}
