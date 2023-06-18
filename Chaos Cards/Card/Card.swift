//
//  Card.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import Foundation

struct Card: Identifiable, Hashable {
    let id: UUID
    let prompt: String
    let answer: String
    
    internal init(id: UUID = UUID(), prompt: String, answer: String) {
        self.id = id
        self.prompt = prompt
        self.answer = answer
    }
}

extension Card {
    init(cardEntity: CardEntity) {
        self.id = cardEntity.id ?? UUID()
        self.prompt = cardEntity.prompt ?? "<error decoding>"
        self.answer = cardEntity.answer ?? "<error decoding>"
    }
}

extension Card {
    static var example: Card {
        return Card(prompt: "Thursday", answer: "wan pha-rue-hat")
    }
    
    var route: Route {
        Route(card: self)
    }
}
