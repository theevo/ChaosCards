//
//  Deck.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Deck {
    let id: UUID
    var name: String
    var cards: [Card]
    
    internal init(id: UUID = UUID(), name: String, cards: [Card]) {
        self.id = id
        self.name = name
        self.cards = cards
    }
}

extension Deck {
    init(deckEntity: DeckEntity) {
        let name = deckEntity.name ?? "<unknown name>"
        let cards = deckEntity.cards()
        let id = deckEntity.id ?? UUID()
        self.init(id: id, name: name, cards: cards)
        print("♥️ deck \(id.uuidString.suffix(4)) has \(cards.count) cards")
    }
}

extension Deck {
    static var example: Deck {
        Deck(name: "🇹🇭 days of the week", cards: [
            Card(prompt: "Sunday", answer: "wan aa-thit"),
            Card(prompt: "Monday", answer: "wan jan"),
            Card(prompt: "Tuesday", answer: "wan ang-kaan"),
            Card(prompt: "Wednesday", answer: "wan phut"),
            Card(prompt: "Thursday", answer: "wan pha-rue-hat"),
            Card(prompt: "Friday", answer: "wan sook"),
            Card(prompt: "Saturday", answer: "wan sao"),
        ])
    }
    
    static var smallExample: Deck {
        Deck(name: "🔴🇹🇭 days of the week", cards: [
            Card(prompt: "Tuesday", answer: "wan ang-kaan"),
            Card(prompt: "Friday", answer: "wan sook"),
            Card(prompt: "Saturday", answer: "wan sao"),
        ])
    }
    
    func getCard(from actionIdentifier: String) -> Card? {
        print("looking for \(actionIdentifier)")
        print(cards.map { $0.id.uuidString })
        let card = cards.first { $0.id.uuidString == actionIdentifier
        }
        return card
    }
}
