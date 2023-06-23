//
//  DeckManager.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/17/23.
//

import Foundation

class DeckManager: ObservableObject {
    @Published var activeDeckIdString: String = ""
    
    init() {
        let defaults = UserDefaults.standard
        guard let id = defaults.string(forKey: "ActiveDeck") else { return }
        self.activeDeckIdString = id
        load(id: id)
    }
    
    func load(id: String) {
        print("👉 load deck id: ", id.suffix(4))
    }
    
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
    static var mock: DeckManager = DeckManager()
}
