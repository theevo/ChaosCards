//
//  QuizService.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/12/23.
//

import Foundation

class QuizService: ObservableObject {
    let deck: Deck
    private(set) var remainingQuestions: [Question] = []
    
    init(deck: Deck) {
        self.deck = deck
    }
}

extension QuizService {
    func pop() -> Question? {
        guard !remainingQuestions.isEmpty else { return nil }
        
        return remainingQuestions.removeFirst()
    }
    
    func setupQuestions(numberOfWrongChoices: Int = 2) {
        let quiz = Quiz(deck: deck)
        remainingQuestions = quiz.makeQuestions()
    }
}
