//
//  QuizServiceResponseTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 5/17/23.
//

import XCTest
@testable import Chaos_Cards

final class QuizServiceResponseTests: XCTestCase {
    func test_notificationInitWithResultsNotification_dataMatches() {
        let response = QuizServiceResponse(title: "Title of the Strongest", subtitle: "Goes to", body: "Himura-san")
        let notification = UNMutableNotificationContent(quizServiceResponse: response)
        XCTAssertEqual(notification.title, response.title)
        XCTAssertEqual(notification.subtitle, response.subtitle)
        XCTAssertEqual(notification.body, response.body)
        XCTAssertEqual(notification.categoryIdentifier, response.id.uuidString)
    }
    
    func test_quizServiceResponse_createsResultsNotification() {
        let correct = 3, outOf = 6
        
        let response = QuizServiceResponse.makeResultsResponse(correct: correct, outOf: outOf)
        let notification = UNMutableNotificationContent(quizServiceResponse: response)
        XCTAssertEqual(notification.title, QuizStrings.results)
        XCTAssertEqual(notification.subtitle, "\(correct) out of \(outOf) correct")
        XCTAssertEqual(notification.body, QuizStrings.tapToOpenApp)
    }
}
