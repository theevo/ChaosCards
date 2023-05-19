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
        
        waitForSendNextQuestion(service: service)
    }
    
    func test_quizService_goesIntoResultStateAfterLastQuestionIsAnswered() throws {
        let service = makeService()
        service.start()
        
        waitForSendNextQuestion(service: service)
        
        let id = try XCTUnwrap(service.currentQuestion?.id.uuidString)
        
        try waitForHandle(service: service, id: id)

        XCTAssertEqual(service.state, .result)
    }
    
    // MARK: - Helpers
    
    let microsecond: TimeInterval = 0.0000000000001
    
    func makeService() -> QuizService {
        let card = Card.example
        let deck = Deck(
            name: "just 1 day from Thailand days of the week",
            cards: [card])
        let service = QuizService(deck: deck)
        return service
    }
    
    func waitForSendNextQuestion(service: QuizService, file: StaticString = #filePath, line: UInt = #line) {
        let expectation = XCTestExpectation(description: "Wait for sendNextQuestion() to finish")
        service.sendNextQuestion()
        expectation.fulfill()
        wait(for: [expectation], timeout: microsecond)
        
        XCTAssertNotNil(service.currentQuestion, file: file, line: line)
    }
    
    func waitForHandle(service: QuizService, id: String, file: StaticString = #filePath, line: UInt = #line) throws {
        let expectation2 = XCTestExpectation(description: "Wait for handle() to finish")
        try service.handle(actionIdentifier: id)
        expectation2.fulfill()
        wait(for: [expectation2], timeout: microsecond)
    }
}
