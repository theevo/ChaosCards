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
        XCTAssertNoThrow(try service.handle(actionIdentifier: QuizStrings.userTappedBanner, userInfo: [:])())
        XCTAssertEqual(service.action, .BannerWasLongPressed)
        
    }
    
    func test_handleString_throwsErrorWhenKeyNotPresent() throws {
        let service = QuizService(deck: Deck.example)
        var thrownError: Error?
        let emptyUserInfo: [AnyHashable: Any] = [:]
        
        XCTAssertThrowsError(try service.handle(actionIdentifier: "789", userInfo: emptyUserInfo)()) {
            thrownError = $0
        }
        XCTAssertTrue(thrownError is ServiceError)
        
        guard case ServiceError.CorrectChoiceKeyNotFound = thrownError! else {
            XCTFail("Expected ServiceError.CorrectChoiceKeyNotFound. Got \(thrownError!) instead")
            return
        }
    }
    
    func test_handleString_knowsResponseIsIncorrectChoice() {
        let service = QuizService(deck: Deck.example)
        XCTAssertNoThrow(try service.handle(actionIdentifier: "789", userInfo: ["correctChoice": "123"])())
        XCTAssertEqual(service.action, .Incorrect)
    }
    
    func test_handleString_knowsResponseIsCorrectChoice() {
        let service = QuizService(deck: Deck.example)
        XCTAssertNoThrow(try service.handle(actionIdentifier: "789", userInfo: ["correctChoice": "789"])())
        XCTAssertEqual(service.action, .Correct)
    }
}
