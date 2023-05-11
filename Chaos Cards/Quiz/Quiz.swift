//
//  Quiz.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Quiz {
    let deck: Deck
}

extension Quiz {
    var questions: [Question] {
        deck.cards.map { card in
            Question(
                card: card,
                wrongChoices: makeWrongChoices(card: card))
        }
    }
    
    func makeWrongChoices(card: Card, count: UInt = 2) -> [Choice] {
        guard count > 0 else { return [] }
        
        var wrongCards = deck.cards.filter { $0 != card }.shuffled()
        var choices: [Choice] = []
        
        for _ in 1...count {
            let oneCard = wrongCards.removeFirst()
            choices.append(Choice(card: oneCard))
        }
        
        return choices
    }
}
