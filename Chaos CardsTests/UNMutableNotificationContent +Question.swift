//
//  UNMutableNotificationContent +Question.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/9/23.
//

import XCTest
@testable import Chaos_Cards

final class UNMutableNotificationContent__Question: XCTestCase {
    
    func test_UNMutableNotifcationContentInit_withQuestion() {
        let question = makeQuestion()
        let notification = UNMutableNotificationContent(question: question)
        
        XCTAssertEqual(notification.title, question.prompt)
        XCTAssertEqual(notification.categoryIdentifier, question.categoryIdentifier)
    }
    
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
        
        XCTAssertNotEqual(titles1, titles2) // flaky
        
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
    
    // MARK: - Helpers
    
    func makeQuestion() -> Question {
        return Question(
            prompt: "Capital of England",
            correctChoice: Choice("London", isCorrect: true),
            wrongChoices: [Choice("Paris"), Choice("Milan")]
        )
    }
}
