//
//  QuizResultTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/17/23.
//

import XCTest
@testable import Chaos_Cards

final class QuizResultTests: XCTestCase {
    func test_logAnswerwithQuestionAndChoice_detectsWrongChoice() {
        var quizResult = QuizResult()
        let question = Question(
            prompt: "Capital of England",
            correctChoice: Choice("London"),
            wrongChoices: [Choice("Paris"), Choice("Milan"), Choice("Beijing"), Choice("Bangkok")]
        )
        let choice = Choice("Milan")
        
        quizResult.logAnswer(question: question, userChoice: choice)
        
        XCTAssertEqual(quizResult.score, 0)
    }
    
    func test_logAnswerwithQuestionAndChoice_detectsCorrectChoice() {
        var quizResult = QuizResult()
        let question = Question(
            prompt: "Capital of England",
            correctChoice: Choice("London"),
            wrongChoices: [Choice("Paris"), Choice("Milan"), Choice("Beijing"), Choice("Bangkok")]
        )
        let choice = Choice("London")
        
        quizResult.logAnswer(question: question, userChoice: choice)
        
        XCTAssertEqual(quizResult.score, 1)
    }
    
    func test_logAnswer_remembersYourAnswer() {
        var quizResult = QuizResult()
        let question = Question(
            prompt: "Capital of England",
            correctChoice: Choice("London"),
            wrongChoices: [Choice("Paris"), Choice("Milan"), Choice("Beijing"), Choice("Bangkok")]
        )
        let choice = Choice("Milan")
        
        quizResult.logAnswer(question: question, userChoice: choice)
        
        guard let answer = quizResult.answers.first else {
            XCTFail("Expected 1 answer in the answers array but received nil instead")
            return
        }
        
        XCTAssertEqual(answer.answered, "Milan")
    }
}
