//
//  UNNotification+QuestionTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/9/23.
//

import XCTest
@testable import Chaos_Cards

final class UNNotification_QuestionTests: XCTestCase {
    
    func test_questionCategoryIdentifier_isUnique() {
        let question1 = makeQuestion()
        let question2 = makeQuestion()
        
        XCTAssertNotEqual(question1.categoryIdentifier, question2.categoryIdentifier)
    }
    
    func test_makeNotificationActions_synthesizesUNActionsFromQuestionChoices() {
        let question = makeQuestion()
        
        let actions = question.makeNotificationActions()
        let titles = actions.map { $0.title }
        
        XCTAssertEqual(titles.count, question.wrongChoices.count + 1)
        XCTAssertTrue(titles.contains(question.correctChoice.rawValue))
    }
    
    func test_makeNotificationActions_randomizesQuestionChoices() {
        let question = makeQuestion()
        
        let actions1 = question.makeNotificationActions()
        let titles1 = actions1.map { $0.title }
        
        let actions2 = question.makeNotificationActions()
        let titles2 = actions2.map { $0.title }
        
        XCTAssertNotEqual(titles1, titles2)
        
        XCTAssertTrue(titles2.contains(question.correctChoice.rawValue))
    }
    
    func test_registerNotificationCategory_categoryIsInTheNotificationCenterSharedInstance() async {
        let question = makeQuestion()
        question.registerNotificationCategory()
        
        let current = UNUserNotificationCenter.current()

        let categories = await current.notificationCategories()

        XCTAssertTrue(categories.contains(where: { category in
            category.identifier == question.categoryIdentifier
        }), "expected \(question.categoryIdentifier) to be registered, but it was not found.")
    }
    
    func test_makeWrongChoices_doesNotContainTheCorrectChoice() {
        let quiz = Quiz(deck: Deck.example)
        guard let sunday = quiz.questions.first else { fatalError("") }
        
        XCTAssertFalse(sunday.wrongChoices.contains { $0.rawValue == sunday.correctChoice.rawValue }, "Expected wrongChoices array NOT to contain the correct choice. The correct choice was found in the wrongChoices array!")
    }
    
    func test_makeWrongChoices_containsAtLeast1WrongChoice() {
        let quiz = Quiz(deck: Deck.example)
        guard let sunday = quiz.questions.first else { fatalError("") }
        
        XCTAssertFalse(sunday.wrongChoices.isEmpty)
    }
    
    func test_makeWrongChoices_doesNotContainDuplicates() {
        let quiz = Quiz(deck: Deck.example)
        guard let sunday = quiz.questions.first else { fatalError("") }
        
        XCTAssertTrue(sunday.wrongChoices.isUnique, "Expected this wrongChoices array to be unique \(sunday.wrongChoices)")
    }
    
    func test_makeWrongChoices_givesRandomChoicesEachTime() {
        let quiz = Quiz(deck: Deck.example)
        guard let sunday1 = quiz.questions.first,
            let sunday2 = quiz.questions.first else { fatalError("")
        }
        
        let wrongChoices1 = sunday1.wrongChoices.map { $0.rawValue }
        let wrongChoices2 = sunday2.wrongChoices.map { $0.rawValue }
        
        XCTAssertNotEqual(wrongChoices1, wrongChoices2)
    }
    
    func test_quizService_init() {
        let quiz = Quiz(deck: Deck.example)
        let service = QuizService(quiz: quiz)
        
        XCTAssertFalse(service.quiz.questions.isEmpty)
    }
    
    func test_quizService_knowsItsQuestions() {
        var service = QuizService(quiz: Quiz(deck: Deck.example))
        
        service.setupQuestions()
        
        XCTAssertFalse(service.remainingQuestions.isEmpty)
    }
    
    func test_quizService_numberOfQuestionsEqualsNumberOfCards() {
        var service = QuizService(quiz: Quiz(deck: Deck.example))
        
        service.setupQuestions()
        
        XCTAssertEqual(service.remainingQuestions.count, service.quiz.questions.count)
    }
    
//    func test_popAndQueue() {
//        let question = QuizService.remainingQuestions.pop()
        // questions can pull answer choices from ALL available cards, not just the choices that have are remaining in the queue
        
        
//    }
    
    // MARK: - Helpers
    
    func makeQuestion() -> Question {
        return Question(
            prompt: "Capital of England",
            correctChoice: Choice("London"),
            wrongChoices: [Choice("Paris"), Choice("Milan"), Choice("Beijing"), Choice("Bangkok")]
        )
    }
}

extension Array<Choice> {
    fileprivate var isUnique: Bool {
        let set = Set(self)
        return self.count == set.count
    }
}
