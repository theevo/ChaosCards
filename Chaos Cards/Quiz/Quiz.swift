//
//  Quiz.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Quiz {
    let deck: Deck
    var allChoices: [Choice] = []
    private(set) var currentQuestion: Question?
    private(set) var remainingQuestions: [Question] = []
    
    var hasQuestionsRemaining: Bool {
        !remainingQuestions.isEmpty
    }
    
    init(deck: Deck) {
        self.deck = deck
        setChoices()
        setQuestions()
    }
    
    @discardableResult public mutating func pop() -> Question? {
        guard hasQuestionsRemaining else {
            currentQuestion = nil
            return nil
        }
        
        let question = remainingQuestions.removeFirst()
        currentQuestion = question
        return question
    }
}

extension Quiz {
    public mutating func setQuestions(numberOfWrongChoices count: UInt = 2) {
        remainingQuestions = deck.cards.map { card in
            Question(
                card: card,
                wrongChoices: makeWrongChoices(card: card, count: count))
        }.shuffled()
    }
    
    private mutating func setChoices() {
        allChoices = deck.cards.map { card in
            Choice(card: card)
        }
    }
    
    func makeWrongChoices(card: Card, count: UInt) -> [Choice] {
        guard count > 0 else { return [] }
        
        let count = Int(count)
        
        let wrongChoices = allChoices.filter { $0.id != card.id }.shuffled()
        
        let wrongChoicesOfSizeCount = Array<Choice>(wrongChoices.prefix(count))
        
        return wrongChoicesOfSizeCount
    }
}
