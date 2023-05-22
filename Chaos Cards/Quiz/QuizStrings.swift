//
//  QuizStrings.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/11/23.
//

import Foundation

struct QuizStrings {
    static let title_quizFromChaosCards = "Quiz from Chaos Cards"
    static let longPressMe = "Long press this notification to see your answer choices"
    static let questionMark = "?"
    static let results = "Results"
    static let screenGetResults = "chaosCards_get_results"
    static let tapToOpenApp = "Tap to review your answers"
    static let userTappedBanner = "com.apple.UNNotificationDefaultActionIdentifier"
    static let whatIsAnswerTo = "What is the answer to...\n"
    
    static func body(prompt: String) -> String {
        QuizStrings.whatIsAnswerTo + prompt + questionMark
    }
}
