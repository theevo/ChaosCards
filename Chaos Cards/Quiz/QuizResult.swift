//
//  QuizResult.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/17/23.
//

import Foundation

struct QuizResult {
    private(set) var score: Int = 0
    private(set) var answers: [QuizUserAnswer] = []
}

extension QuizResult {
    public mutating func logAnswer(question: Question, userChoice: Choice?) {
        let answer = QuizUserAnswer(question: question, userChoice: userChoice)
        logAnswer(answer: answer)
    }
}

extension QuizResult {
    private mutating func addPoint() {
        score += 1
    }
    
    private mutating func logAnswer(answer: QuizUserAnswer) {
        if answer.isCorrect {
            addPoint()
            print("✅ That was the correct answer.")
        } else {
            print("🚫 That was incorrect.")
            print("You answered \(answer.answered)")
        }
        print("\(answer.prompt) = \(answer.correct)")
        
        answers.append(answer)
        print("=== Score: \(score) ===")
    }
}
