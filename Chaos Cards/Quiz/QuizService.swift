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

enum ServiceError: Error {
    case NoMoreQuestions
    case NotificationCenter(Error)
    case CorrectChoiceKeyNotFound
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
            try handle(actionIdentifier: response.actionIdentifier, userInfo: response.notification.request.content.userInfo)()
        } catch {
            print(error)
        }
    }
    
    internal func handle(actionIdentifier: String, userInfo: [AnyHashable : Any]) throws -> () -> Void {
        guard actionIdentifier != QuizStrings.userTappedBanner else {
            return {
                print("you tapped on the banner, silly")
                self.action = .BannerWasLongPressed
            }
        }
        
        // we got an actual action
        
        guard let correctChoice = userInfo["correctChoice"] as? String else { throw ServiceError.CorrectChoiceKeyNotFound }
        
        if actionIdentifier == correctChoice {
            return {
                self.action = .Correct
            }
        } else {
            return {
                self.action = .Incorrect
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
