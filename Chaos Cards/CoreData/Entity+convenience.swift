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
    }
}
