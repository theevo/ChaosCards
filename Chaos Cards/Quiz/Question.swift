//
//  Question.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Question {
    let prompt: String
    let correctAnswer: String
    let wrongAnswers: [String]
}

extension Question {
    var choices: [String] {
        ([correctAnswer] + wrongAnswers).shuffled()
    }
}
