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
    private(set) var currentQuestion: Question?
    var action: QuizAction?
    
    /// Creates a QuizService based on the Deck. `.setupQuestions()` will create exactly the same number of multiple-choice questions as the number of cards in the deck. Questions will be randomized.
    /// - Parameter deck: deck can have 1 or more cards
    init(deck: Deck) {
        self.deck = deck
    }
}

enum ServiceError: Error {
    case NoMoreQuestions
    case NotificationCenter(Error)
    case CurrentQuestionNil
}

extension QuizService {
    
    enum QuizAction {
        case BannerWasLongPressed
        case Correct
        case Incorrect
    }
}

extension QuizService {
    func handle(response: UNNotificationResponse) {
        do {
            try handle(actionIdentifier: response.actionIdentifier)()
            Task { try await popAndSend(in: 0.1) }
        } catch {
            print(error)
        }
    }
    
    internal func handle(actionIdentifier: String) throws -> () -> Void {
        guard actionIdentifier != QuizStrings.userTappedBanner else {
            return {
                print("you tapped on the banner, silly")
                self.action = .BannerWasLongPressed
            }
        }
        
        guard let currentQuestion = currentQuestion else {
            throw ServiceError.CurrentQuestionNil
        }
        
        // we got an actual action
        
        if actionIdentifier == currentQuestion.correctChoice.id.uuidString {
            return {
                self.action = .Correct
                print("✅ That was the correct answer.")
            }
        } else {
            return {
                self.action = .Incorrect
                print("🚫 That was incorrect.")
            }
        }
        
    }
    
    @discardableResult func pop() -> Question? {
        guard !remainingQuestions.isEmpty else { return nil }
        
        let question = remainingQuestions.removeFirst()
        
        currentQuestion = question
        
        return question
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
