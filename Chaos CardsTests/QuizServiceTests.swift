//
//  QuizServiceTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/15/23.
//

import XCTest
@testable import Chaos_Cards

final class QuizServiceTests: XCTestCase {
    func test_sut_notificationCenterIsNilForTesting() {
        let service = makeSUT()
        
        XCTAssertNil(service.notificationCenter)
    }
    
    func test_handleString_knowsBannerWasTapped() throws {
        let service = QuizService(deck: Deck.example)
        try service.userTapsNotificationAction(actionIdentifier: QuizStrings.userTappedBanner)
        XCTAssertEqual(service.action, .BannerWasLongPressed)
    }
    
    func test_pop_willSetCurrentQuestion() throws {
        let service = makeSUT()
        let correctId = try XCTUnwrap(service.currentQuestion?.correctChoice.id)
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
    
    func test_setupQuestions_fillsAnEqualNumberOfRemainingQuestions() {
        let service = QuizService(deck: Deck.example)
        let cardCount = Deck.example.cards.count
        
        service.start()
        
        XCTAssertEqual(service.remainingQuestions.count, cardCount)
    }
    
    func test_pop_returnsNilwhenThereAreNoMoreQuestions() {
        let deck = Deck(name: "Thailand days of the week", cards: [Card.example])
        let service = makeSUT(deck: deck)
        
        XCTAssertTrue(service.remainingQuestions.isEmpty)
        
        let shouldBeNil = service.pop()
        
        XCTAssertNil(shouldBeNil)
    }
    
    func test_scoreKeeper_resetsWhenANewQuizStartsAfterFinishingAQuiz() throws {
        let card = Card.example
        let deck = Deck(name: "just 1 day from Thailand days of the week", cards: [card])
        let service = QuizService(deck: deck)
        
        service.start()
        service.pop()
        try service.handle(actionIdentifier: card.id.uuidString)
        
        XCTAssertEqual(service.scoreKeeper.score, 1)
        XCTAssertEqual(service.scoreKeeper.answers.count, 1)
        
        service.finish()
        service.start()
        XCTAssertEqual(service.scoreKeeper.score, 0)
        XCTAssertEqual(service.scoreKeeper.answers.count, 0)
    }
    
    // MARK: - Helpers
    
    func makeSUT(deck: Deck = Deck.example) -> QuizService {
        let service = QuizService(deck: deck)
        service.start()
        service.pop()
        return service
    }
}

extension QuizService {
    fileprivate func userTapsNotificationAction(actionIdentifier: String) throws {
        try handle(actionIdentifier: actionIdentifier)
    }
}
