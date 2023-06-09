//
//  DeckBox.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/9/23.
//

import Foundation

struct DeckBox {
    var selectedDeckId: UUID?
    var decks: [Deck]
}

extension DeckBox {
    init(boxEntity: BoxEntity) {
        self.selectedDeckId = boxEntity.selectedDeckId
        self.decks = boxEntity.deckEntities?.decks ?? []
    }
}
