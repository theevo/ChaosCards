//
//  Entity+convenience.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/8/23.
//

import CoreData

extension DeckEntity {
    convenience init(deck: Deck, moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.name = deck.name
        self.id = deck.id
        
        for card in deck.cards {
            self.addToCardsSet(CardEntity(card: card, moc: moc))
        }
        
        print("🍀 deck \(deck.id.uuidString.suffix(4)) has \(String(describing: self.cardsSet?.count)) cards")
    }
    
    func cards() -> [Card] {
        guard let set = self.cardsSet,
              let entities = set.allObjects as? [CardEntity]
        else {
            print("💥 failed to convert [CardEntity]")
            return []
        }
        
        return entities.map { Card(cardEntity: $0) }
    }
}

extension CardEntity {
    convenience init(card: Card, moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.prompt = card.prompt
        self.answer = card.answer
    }
}

