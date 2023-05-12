//
//  QuizService.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/12/23.
//

import Foundation

struct QuizService {
    let quiz: Quiz
    private(set) var remainingQuestions: [Question] = []
}

extension QuizService {
    mutating func setupQuestions(numberOfWrongChoices: Int = 2) {
        let question = Question(
            prompt: "Capital of England",
            correctChoice: Choice("London"),
            wrongChoices: [Choice("Paris"), Choice("Milan"), Choice("Beijing"), Choice("Bangkok")])
        remainingQuestions = [question]
    }
}
