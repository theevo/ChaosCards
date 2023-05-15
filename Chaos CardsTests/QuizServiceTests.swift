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
        service.handle(string: QuizStrings.userTappedBanner)()
        XCTAssertEqual(service.action, .BannerWasLongPressed)
    }
}
