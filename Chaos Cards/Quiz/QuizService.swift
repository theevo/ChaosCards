//
//  QuizService.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/12/23.
//

import Foundation
import UserNotifications

class QuizService: ObservableObject {
    let deck: Deck
    private(set) var remainingQuestions: [Question] = []
    var action: QuizAction?
    
    init(deck: Deck) {
        self.deck = deck
    }
}

extension QuizService {
    enum ServiceError: Error {
        case NoMoreQuestions
        case NotificationCenter(Error)
    }
    
    enum QuizAction {
        case BannerWasLongPressed
        case Correct
        case Incorrect
    }
}

extension QuizService {
    func handle(response: UNNotificationResponse) {
        handle(string: response.actionIdentifier)()
    }
    
    internal func handle(string: String) -> () -> Void {
        switch string {
        case QuizStrings.userTappedBanner:
            return {
                print("you tapped on the banner, silly")
                self.action = QuizAction.BannerWasLongPressed
            }
        default:
            return {
                print("you tapped on \(self.deck.getCard(from: string))")
                self.action = QuizAction.Correct
            }
        }
    }
    
    func pop() -> Question? {
        guard !remainingQuestions.isEmpty else { return nil }
        
        return remainingQuestions.removeFirst()
    }
    
    @discardableResult func popAndSend(in seconds: TimeInterval) async throws -> Question {
        guard let question = pop() else { throw ServiceError.NoMoreQuestions }
        
        // send the notification
        question.registerNotificationCategory()
        
        let content = UNMutableNotificationContent(question: question)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        do {
            try await UNUserNotificationCenter.current().add(request)
            return question
        } catch {
            throw ServiceError.NotificationCenter(error)
        }
    }
    
    func setupQuestions(numberOfWrongChoices: UInt = 2) {
        let quiz = Quiz(deck: deck)
        remainingQuestions = quiz.makeQuestions(numberOfWrongChoices: numberOfWrongChoices)
    }
}
