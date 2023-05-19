//
//  QuizSequenceTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/18/23.
//

import XCTest
@testable import Chaos_Cards

final class QuizSequenceTests: XCTestCase {
    func test_quizService_beginsInNotStarted() {
        let service = makeService()
        
        XCTAssertEqual(service.state, .notstarted)
    }
    
    func test_quizService_goesIntoPlayingStateAfterStart() {
        let service = makeService()
        
        service.start()
        
        XCTAssertEqual(service.state, .playing)
    }
    
    func test_currentQuestion_shouldNotBeNilIfThereIsARemainingQuestionAfterCallingSendNextQuestion() {
        let service = makeService()
        service.start()
        
        let expectation = XCTestExpectation(description: "Wait for sendNextQuestion() to finish")
        service.sendNextQuestion()
        expectation.fulfill()
        wait(for: [expectation], timeout: 0.001)
        
        XCTAssertNotNil(service.currentQuestion)
    }
    
//    func test_quizService_goesIntoResultStateAfterLastQuestionIsAnswered() async throws {
//        let service = makeService()
//        service.start()
//        service.sendNextQuestion()
//
//        let id = try XCTUnwrap(service.currentQuestion?.id.uuidString)
//
//        try service.handle(actionIdentifier: id)
//
//        XCTAssertEqual(service.state, .result)
//    }
    
    // MARK: - Helpers
    
    func makeService() -> QuizService {
        let card = Card.example
        let deck = Deck(
            name: "just 1 day from Thailand days of the week",
            cards: [card])
        let service = QuizService(deck: deck)
        return service
    }
}
