//
//  QuizTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/19/23.
//

import XCTest
@testable import Chaos_Cards

final class QuizTests: XCTestCase {
    func test_makeWrongChoices_doesNotContainTheCorrectChoice() {
        let quiz = Quiz(deck: Deck.example)
        guard let question = quiz.remainingQuestions.first else {
            XCTFail("Expected first question but received nil instead.")
            return
        }
        
        XCTAssertFalse(question.wrongChoices.contains { $0.rawValue == question.correctChoice.rawValue }, "Expected wrongChoices array NOT to contain the correct choice. The correct choice was found in the wrongChoices array!")
    }
    
    func test_makeWrongChoices_containsAtLeast1WrongChoice() {
        let quiz = Quiz(deck: Deck.example)
        guard let sunday = quiz.remainingQuestions.first else {
            XCTFail("Expected first question but received nil instead.")
            return
        }
        
        XCTAssertFalse(sunday.wrongChoices.isEmpty)
    }
    
    func test_makeWrongChoices_doesNotContainDuplicates() {
        let quiz = Quiz(deck: Deck.example)
        guard let sunday = quiz.remainingQuestions.first else {
            XCTFail("Expected first question but received nil instead.")
            return
        }
        
        XCTAssertTrue(sunday.wrongChoices.isUnique, "Expected this wrongChoices array to be unique \(sunday.wrongChoices)")
    }
    
    func test_makeWrongChoices_givesRandomChoicesEachTime() {
        let quiz1 = Quiz(deck: Deck.example)
        let quiz2 = Quiz(deck: Deck.example)
        let quiz3 = Quiz(deck: Deck.example)
        
        guard let sunday1 = quiz1.remainingQuestions.first,
              let sunday2 = quiz2.remainingQuestions.first,
              let sunday3 = quiz3.remainingQuestions.first else {
            XCTFail("Expected to receive one question from makeQuestions but received nil for one of them.")
            return
        }
        
        let wrongChoices1 = sunday1.wrongChoices.map { $0.rawValue }
        let wrongChoices2 = sunday2.wrongChoices.map { $0.rawValue }
        let wrongChoices3 = sunday3.wrongChoices.map { $0.rawValue }
        
        let choices1VS2 = wrongChoices1 == wrongChoices2
        let choices2vs3 = wrongChoices2 == wrongChoices3
        
        XCTAssertFalse(choices1VS2 && choices2vs3, "We want randomness in our wrong choices. All of these are the same: \(wrongChoices1) \(wrongChoices2) \(wrongChoices3)")
    }
    
    func test_makeWrongChoices_returnsTheSameNumberOfChoicesAsDeclaredInCountParameter() {
        let count = 2
        
        let quiz = Quiz(deck: Deck.example)
        guard let sunday = quiz.remainingQuestions.first else {
            XCTFail("Expected the first element of makeQuestions() but received nil instead.")
            return
        }
        
        XCTAssertEqual(count, sunday.wrongChoices.count)
    }
    
    func test_quizQuestions_isRandom() {
        let quiz1 = Quiz(deck: Deck.example)
        let quiz2 = Quiz(deck: Deck.example)
        
        let prompts1 = quiz1.remainingQuestions.map { $0.prompt }
        let prompts2 = quiz2.remainingQuestions.map { $0.prompt }
        
        XCTAssertNotEqual(prompts1, prompts2)
    }
}

extension Array<Choice> {
    fileprivate var isUnique: Bool {
        let set = Set(self)
        return self.count == set.count
    }
}
