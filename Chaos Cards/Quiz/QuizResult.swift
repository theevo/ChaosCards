//
//  QuizResult.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/17/23.
//

import Foundation

struct QuizUserAnswer {
    var prompt: String
    var answered: String
    var correct: String
    
    var isCorrect: Bool {
        answered == correct
    }
}

struct QuizResult {
    private(set) var score: Int = 0
    private(set) var answers: [QuizUserAnswer] = []
    
    mutating func correctAnswer() {
        score += 1
    }
    
    mutating func logAnswer(answer: QuizUserAnswer) {
        if answer.isCorrect {
            correctAnswer()
        }
        answers.append(answer)
    }
}
