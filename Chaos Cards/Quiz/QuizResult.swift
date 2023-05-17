//
//  QuizResult.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/17/23.
//

import Foundation

struct QuizResult {
    private(set) var score: Int = 0
    
    mutating func correctAnswer() {
        score += 1
    }
}
