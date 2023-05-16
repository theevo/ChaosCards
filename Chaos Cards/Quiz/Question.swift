//
//  Question.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Question {
    let id: UUID
    let prompt: String
    let correctChoice: Choice
    let wrongChoices: [Choice]
    
    init(id: UUID = UUID(),
         prompt: String,
         correctChoice: Choice,
         wrongChoices: [Choice]) {
        self.id = id
        self.prompt = prompt
        self.correctChoice = correctChoice
        self.wrongChoices = wrongChoices
    }
    
    init(card: Card, wrongChoices: [Choice]) {
        self.id = card.id
        self.prompt = card.prompt
        self.correctChoice = Choice(card: card)
        self.wrongChoices = wrongChoices
    }
}

extension Question {
    var categoryIdentifier: String {
        "question_\(id.uuidString)"
    }
}
