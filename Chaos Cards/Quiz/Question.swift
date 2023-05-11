//
//  Question.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Question {
    // TODO: - can we borrow the Card's UUID?
    let id = UUID()
    let prompt: String
    let correctChoice: Choice
    let wrongChoices: [Choice]
}

extension Question {
    var categoryIdentifier: String {
        "question_\(id.uuidString)"
    }
}
