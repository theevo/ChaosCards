//
//  Quiz.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Quiz {
    let deck: Deck
    let questions: [Question]
    
    init(deck: Deck) {
        self.deck = deck
        
        let questions: [Question] = deck.cards.map { card in
            Question(prompt: card.prompt, correctAnswer: card.answer, wrongAnswers: ["wrong answer", "don't pick me"])
        }
        
        self.questions = questions
    }
}
