//
//  QuizUserAnswer.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/17/23.
//

import Foundation

struct QuizUserAnswer: Hashable {
    let id = UUID()
    var prompt: String
    var answered: String
    var correct: String
    
    var isCorrect: Bool {
        answered == correct
    }
}

extension QuizUserAnswer {
    public init(question: Question, userChoice: Choice?) {
        let userAnswered = userChoice?.rawValue ?? "<error>"
        
        self.prompt = question.prompt
        self.answered = userAnswered
        self.correct = question.correctChoice.rawValue
    }
}
