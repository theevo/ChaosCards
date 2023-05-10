//
//  Question.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Question {
    let id = UUID()
    let prompt: String
    let correctChoice: Choice
    let wrongChoices: [Choice]
}

extension Question {
    static var longPressMe = "Long press this notification to see your answer choices"
    
    var categoryIdentifier: String {
        "question_\(id.uuidString)"
    }
}
