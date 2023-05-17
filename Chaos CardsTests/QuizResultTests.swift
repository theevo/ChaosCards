//
//  QuizResultTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/17/23.
//

import XCTest
@testable import Chaos_Cards

final class QuizResultTests: XCTestCase {
    func test_quizResult_keepsScore() {
        var quizResult = QuizResult()
        
        quizResult.correctAnswer()
        
        XCTAssertEqual(quizResult.score, 1)
    }
}
