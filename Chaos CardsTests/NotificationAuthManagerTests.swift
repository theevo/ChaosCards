//
//  NotificationAuthManagerTests.swift
//  Chaos CardsTests
//
//  Created by Theo Vora on 6/4/23.
//

import XCTest
import UserNotifications

class NotificationAuthManager {
    var center: UNUserNotificationCenter
    var options: [UNNotificationPresentationOptions] = []
    
    init(
        center: UNUserNotificationCenter = UNUserNotificationCenter.current(),
        options: [UNNotificationPresentationOptions]
    ) {
        self.center = center
        self.options = options
    }
    
    func authorize() throws {
        Task { try await center.requestAuthorization() }
    }
}

extension NotificationAuthManager {
    static let ChaosCardsSettings: [UNNotificationPresentationOptions] = []
}

final class NotificationAuthManagerTests: XCTestCase {
    
    func test_authorize_authorizes() {
        let manager = NotificationAuthManager(options: NotificationAuthManager.ChaosCardsSettings)
        
        do {
            try manager.authorize()
        } catch  {
            print(error)
            XCTFail()
        }
    }
}
