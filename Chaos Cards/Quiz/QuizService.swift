//
//  QuizService.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/12/23.
//

import Foundation

class QuizService: ObservableObject {
    let quiz: Quiz
    private(set) var remainingQuestions: [Question]
    
    init(quiz: Quiz, remainingQuestions: [Question] = []) {
        self.quiz = quiz
        self.remainingQuestions = remainingQuestions
    }
}

extension QuizService {
    func setupQuestions(numberOfWrongChoices: Int = 2) {
        remainingQuestions = quiz.questions
    }
}
