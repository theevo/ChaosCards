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
        let question = Question(prompt: "Capital of England", correctChoice: Choice("London", isCorrect: true), wrongChoices: [Choice("Paris"), Choice("Milan")])
        let notification = UNMutableNotificationContent(question: question)
        
        XCTAssertEqual(notification.title, question.prompt)
        XCTAssertEqual(notification.categoryIdentifier, question.categoryIdentifier)
    }
    
    func test_questionCategoryIdentifier_isUnique() {
        let question1 = Question(prompt: "Capital of England", correctChoice: Choice("London", isCorrect: true), wrongChoices: [Choice("Paris"), Choice("Milan")])
        let question2 = Question(prompt: "Capital of England", correctChoice: Choice("London", isCorrect: true), wrongChoices: [Choice("Paris"), Choice("Milan")])
        
        XCTAssertNotEqual(question1.categoryIdentifier, question2.categoryIdentifier)
    }
    
    func test_question_synthesizesUNActionsFromChoices() async {
        let question = Question(prompt: "Capital of England", correctChoice: Choice("London", isCorrect: true), wrongChoices: [Choice("Paris"), Choice("Milan")])
        
        let actions = question.makeNotificationActions()
        let titles = actions.map { $0.title }
        
        XCTAssertTrue(titles.contains(question.correctChoice.rawValue))
        
//        let current = UNUserNotificationCenter.current()
//
//        let categories = await current.notificationCategories()
//
//        XCTAssertTrue(categories.contains(where: { category in
//            category.identifier == question.categoryIdentifier
//        }))
    }
    
    func test_makeNotificationActions_randomizesQuestionChoices() {
        let question = Question(prompt: "Capital of England", correctChoice: Choice("London", isCorrect: true), wrongChoices: [Choice("Paris"), Choice("Milan")])
        
        let actions1 = question.makeNotificationActions()
        let titles1 = actions1.map { $0.title }
        
        let actions2 = question.makeNotificationActions()
        let titles2 = actions2.map { $0.title }
        
        XCTAssertNotEqual(titles1, titles2) // flaky
        
        XCTAssertTrue(titles2.contains(question.correctChoice.rawValue))
    }
}
