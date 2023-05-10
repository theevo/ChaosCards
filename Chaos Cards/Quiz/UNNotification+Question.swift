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
        
        self.title = question.prompt
        self.body = Question.longPressMe
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
