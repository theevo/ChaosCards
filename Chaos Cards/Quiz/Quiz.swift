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
                prompt: card.prompt,
                correctChoice: Choice(card.answer, isCorrect: true),
                wrongChoices: makeWrongChoices(card: card))
        }
    }
    
    func makeWrongChoices(card: Card) -> [Choice] {
        return []
    }
}
