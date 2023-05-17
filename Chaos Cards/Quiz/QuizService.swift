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
    let quiz: Quiz
    private(set) var remainingQuestions: [Question] = []
    private(set) var currentQuestion: Question?
    private(set) var result = QuizResult()
    var action: QuizAction?
    
    /// Creates a QuizService based on the Deck. `.setupQuestions()` will create exactly the same number of multiple-choice questions as the number of cards in the deck. Questions will be randomized.
    /// - Parameter deck: deck can have 1 or more cards
    init(deck: Deck) {
        self.deck = deck
        self.quiz = Quiz(deck: deck)
    }
}

// TODO: - move this inside QuizService
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
    func choice(id: String) -> Choice? {
        quiz.allChoices.first { $0.id.uuidString == id }
    }
    
    func handle(response: UNNotificationResponse) {
        do {
            try handle(actionIdentifier: response.actionIdentifier)
            Task { try await popAndSend(in: 0.1) }
        } catch {
            print(error)
        }
    }
    
    internal func handle(actionIdentifier: String) throws {
        guard actionIdentifier != QuizStrings.userTappedBanner else {
            print("you tapped on the banner, silly")
            self.action = .BannerWasLongPressed
            return
        }
        
        guard let currentQuestion = currentQuestion else {
            throw ServiceError.CurrentQuestionNil
        }
        
        // we got an actual action
        
        let userChoice = choice(id: actionIdentifier)
        result.logAnswer(question: currentQuestion, userChoice: userChoice)
        
        if actionIdentifier == currentQuestion.correctChoice.id.uuidString {
            self.action = .Correct
        } else {
            self.action = .Incorrect
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
        remainingQuestions = quiz.makeQuestions(numberOfWrongChoices: numberOfWrongChoices)
    }
}
