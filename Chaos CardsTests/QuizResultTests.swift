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
    
    func test_quizResult_detectsAnswerCorrectness() {
        var quizResult = QuizResult()
        let someAnswer = QuizUserAnswer(
            prompt: "qwerty",
            answered: "asdf",
            correct: "asdf"
        )
        
        quizResult.logAnswer(answer: someAnswer)
        
        XCTAssertEqual(quizResult.score, 1)
    }
    
    func test_quizResult_remembersYourAnswer() throws {
        var quizResult = QuizResult()
        let someAnswer = QuizUserAnswer(
            prompt: "Capital of Thailand",
            answered: "Krung Thep",
            correct: "Krung Thep"
        )
        
        quizResult.logAnswer(answer: someAnswer)
        
        guard let answer = quizResult.answers.first else {
            XCTFail("Expected 1 answer in the answers array but received nil instead")
            return
        }
        
        XCTAssertEqual(answer.answered, "Krung Thep")
    }

}
