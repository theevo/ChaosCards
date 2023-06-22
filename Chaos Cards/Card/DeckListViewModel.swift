//
//  DeckListViewModel.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/17/23.
//

import Foundation

class DeckListViewModel: ObservableObject {
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

extension DeckListViewModel: Equatable {
    static func == (lhs: DeckListViewModel, rhs: DeckListViewModel) -> Bool {
        lhs.activeDeckIdString == rhs.activeDeckIdString
    }
}
