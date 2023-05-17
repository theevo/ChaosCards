//
//  QuizServiceTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/15/23.
//

import XCTest
@testable import Chaos_Cards

final class QuizServiceTests: XCTestCase {
    func test_handleString_knowsBannerWasTapped() {
        let service = QuizService(deck: Deck.example)
        XCTAssertNoThrow(try service.handle(actionIdentifier: QuizStrings.userTappedBanner))
        XCTAssertEqual(service.action, .BannerWasLongPressed)
        
    }
    
    func test_pop_willSetCurrentQuestion() throws {
        let service = makeSUT()
        let correctId = try XCTUnwrap(service.currentQuestion?.correctChoice.id)
        XCTAssertNotNil(service.currentQuestion)
        XCTAssertEqual(correctId, service.currentQuestion?.id)
    }
    
    func test_handleString_knowsResponseIsIncorrectChoice() {
        let service = makeSUT()
        XCTAssertNoThrow(try service.userTapsNotificationAction(actionIdentifier: "789"))
        XCTAssertEqual(service.action, .Incorrect)
    }
    
    func test_handleString_knowsResponseIsCorrectChoice() throws {
        let service = makeSUT()
        let correctId = try XCTUnwrap(service.currentQuestion?.correctChoice.id.uuidString)
        XCTAssertNoThrow(try service.userTapsNotificationAction(actionIdentifier: correctId))
        XCTAssertEqual(service.action, .Correct)
    }
    
    // MARK: - Helpers
    
    func makeSUT() -> QuizService {
        let service = QuizService(deck: Deck.example)
        service.setupQuestions()
        service.pop()
        return service
    }
    
    
}

extension QuizService {
    fileprivate func userTapsNotificationAction(actionIdentifier: String) throws {
        try handle(actionIdentifier: actionIdentifier)
    }
}
