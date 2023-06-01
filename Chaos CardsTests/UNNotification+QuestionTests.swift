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
        let current = UNUserNotificationCenter.current()
        
        await question.registerNotificationCategory(center: current)
        
        let categories = await current.notificationCategories()
        XCTAssertTrue(categories.contains(where: { category in
            category.identifier == question.categoryIdentifier
        }), "expected \(question.categoryIdentifier) to be registered, but it was not found.")
    }
    
    func test_quizServiceSetupQuestions_numberOfQuestionsEqualsNumberOfCards() {
        let service = makeQuizService()
        
        service.start()
        
        XCTAssertEqual(service.remainingQuestions.count, service.deck.cards.count)
    }
    
    func test_quizServicePop_willTakeFirstQuestionFromRemainingQuestions() {
        let service = makeQuizService()
        service.start()
        let countBeforePop = service.remainingQuestions.count
        
        let question = service.pop()
        
        XCTAssertNotNil(question)
        XCTAssertEqual(service.remainingQuestions.count, countBeforePop - 1)
    }
    
    func test_cardIDisTheSameAsChoiceID() {
        let card = Card(prompt: "foo", answer: "bar")
        let choice = Choice(card: card)
        XCTAssertEqual(card.id, choice.id)
    }
    
    func test_notificationStartsIn_doesNotAllowZero() {
        let allTimeIntervals = NotificationStartsIn.allCases.map { $0.timeInterval }
        
        XCTAssertFalse(allTimeIntervals.contains(0), "You'll receive a runtime crash if 0 is passed to UNTimeIntervalNotificationTrigger")
    }
    
    
    // MARK: - Helpers
    
    func makeQuizService() -> QuizService {
        QuizService(deck: Deck.example)
    }
    
    public func makeQuestion() -> Question {
        return Question(
            prompt: "Capital of England",
            correctChoice: Choice("London"),
            wrongChoices: [Choice("Paris"), Choice("Milan"), Choice("Beijing"), Choice("Bangkok")]
        )
    }
}


