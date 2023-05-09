//
//  Question.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Question {
    let prompt: String
    let correctChoice: Choice
    let wrongChoices: [Choice]
}
