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
        let service = QuizService(deck: Deck.example)
        
        XCTAssertEqual(service.state, .notstarted)
    }
    
    func test_quizService_goesIntoPlayingStateAfterStart() {
        let service = QuizService(deck: Deck.example)
        
        service.start()
        
        XCTAssertEqual(service.state, .playing)
    }
}
