//
//  UNNotification+Question.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/10/23.
//

import Foundation
import UserNotifications

extension UNMutableNotificationContent {
    convenience init(question: Question) {
        self.init()
        
        self.title = QuizStrings.title_quizFromChaosCards
        self.body = QuizStrings.body(prompt: question.prompt)
        self.sound = .default
        self.categoryIdentifier = question.categoryIdentifier
    }
}

extension UNNotificationAction {
    convenience init(choice: Choice) {
        self.init(identifier: choice.id.uuidString, title: choice.rawValue)
    }
}

extension Question {
    // TODO: - make this private.
    /// This is not meant to be called directly
    func makeNotificationActions() -> [UNNotificationAction] {
        
        let correctAction = UNNotificationAction(choice: correctChoice)
        
        let incorrectActions = wrongChoices.map { choice in
            UNNotificationAction(choice: choice)
        }
        
        return ([correctAction] + incorrectActions).shuffled()
    }
    
    func registerNotificationCategory() {
        let category = UNNotificationCategory(
            identifier: categoryIdentifier,
            actions: makeNotificationActions(),
            intentIdentifiers: [],
            options: [])

        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
}

extension Quiz {
    /// Initializes and adds a non-repeating `UNNotificationRequest` based on the question (self)
    /// - Parameter seconds: number of seconds from now when this notification will trigger
    func queueNotification(in seconds: TimeInterval) {
        let question1 = self.questions.first!
        
        question1.registerNotificationCategory()
        
        let content = UNMutableNotificationContent(question: question1)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
