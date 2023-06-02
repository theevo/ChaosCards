//
//  ScoreKeeper.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/17/23.
//

import Foundation

struct ScoreKeeper {
    private let id = UUID()
    private(set) var score: Int = 0
    private(set) var answers: [QuizUserAnswer] = []
}

extension ScoreKeeper {
    public var outOf: Int {
        answers.count
    }
    
    // TODO: - will be annoying to debug later. if we can't find the id, we should communicate this somewhere.
    public mutating func logAnswer(question: Question, userChoice: Choice?) {
        let answer = QuizUserAnswer(question: question, userChoice: userChoice)
        logAnswer(answer: answer)
    }
}

extension ScoreKeeper {
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

extension ScoreKeeper: Equatable, Hashable {
    static func == (lhs: ScoreKeeper, rhs: ScoreKeeper) -> Bool {
        lhs.id == rhs.id
    }
}

extension ScoreKeeper {
    static let sample = ScoreKeeper(score: 2, answers: [
        QuizUserAnswer(prompt: "Monday", answered: "wan-jan", correct: "wan-jan"),
        QuizUserAnswer(prompt: "Tuesday", answered: "wan-jan", correct: "wan-aang-kaan"),
        QuizUserAnswer(prompt: "Wednesday", answered: "wan-phut", correct: "wan-phut")
    ])
}
