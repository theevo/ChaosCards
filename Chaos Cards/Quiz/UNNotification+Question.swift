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
    
    convenience init(quizServiceResponse response: QuizServiceResponse) {
        self.init()
        self.title = response.title
        self.subtitle = response.subtitle
        self.body = response.body
        self.sound = .default
        self.categoryIdentifier = response.id.uuidString
        self.targetContentIdentifier = QuizStrings.screenGetResults
    }
}

extension UNNotificationAction {
    convenience init(choice: Choice) {
        self.init(identifier: choice.id.uuidString, title: choice.rawValue)
    }
}

extension Question {
    /// This is not meant to be called directly
    func makeNotificationActions() -> [UNNotificationAction] {
        
        let correctAction = UNNotificationAction(choice: correctChoice)
        
        let incorrectActions = wrongChoices.map { choice in
            UNNotificationAction(choice: choice)
        }
        
        return ([correctAction] + incorrectActions).shuffled()
    }
    
    func registerNotificationCategory(center: UNUserNotificationCenter?) async {
        let category = UNNotificationCategory(
            identifier: categoryIdentifier,
            actions: makeNotificationActions(),
            intentIdentifiers: [],
            options: [])
        
        await center?.add(category: category)
    }
}

extension UNUserNotificationCenter {
    func add(category: UNNotificationCategory) async {
        var categories = await self.notificationCategories()
        
        categories.insert(category)
        
        self.setNotificationCategories(categories)
    }
}
