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

extension QuizUserAnswer {
    public init(question: Question, userChoice: Choice?) {
        let userAnswered = userChoice?.rawValue ?? "<error>"
        
        self.prompt = question.prompt
        self.answered = userAnswered
        self.correct = question.correctChoice.rawValue
    }
}

struct QuizResult {
    private(set) var score: Int = 0
    private(set) var answers: [QuizUserAnswer] = []
}

extension QuizResult {
    mutating func correctAnswer() {
        score += 1
    }
    
    mutating func logAnswer(answer: QuizUserAnswer) {
        if answer.isCorrect {
            correctAnswer()
            print("✅ That was the correct answer.")
        } else {
            print("🚫 That was incorrect.")
            print("You answered \(answer.answered)")
        }
        print("\(answer.prompt) = \(answer.correct)")
        
        answers.append(answer)
        print("=== Score: \(score) ===")
    }
    
    mutating func logAnswer(question: Question, userChoice: Choice?) {
        let answer = QuizUserAnswer(question: question, userChoice: userChoice)
        logAnswer(answer: answer)
    }
}
