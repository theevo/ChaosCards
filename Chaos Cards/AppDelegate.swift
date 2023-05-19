//
//  AppDelegate.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/11/23.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    var quizService: QuizService = QuizService(
        deck: Deck.example,
        notificationCenter: UNUserNotificationCenter.current()
    )
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let center = quizService.notificationCenter
        center?.delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        quizService.handle(response: response)
        completionHandler()
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        // Update the app interface directly
        
        completionHandler([.banner, .sound])
    }
}
