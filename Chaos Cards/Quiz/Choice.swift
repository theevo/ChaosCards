//
//  Choice.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Choice: Hashable {
    let id: UUID
    let rawValue: String
}

extension Choice {
    init(card: Card) {
        self.id = card.id
        self.rawValue = card.answer
    }
    
    init(_ string: String) {
        self.id = UUID()
        self.rawValue = string
    }
}
