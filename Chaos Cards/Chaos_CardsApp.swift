//
//  Chaos_CardsApp.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

@main
struct Chaos_CardsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
//            CardListView()
//                .environmentObject(appDelegate.quizService)
            DecksListView()
                .environment(\.managedObjectContext, PersistentContainer().persistentContainer.viewContext)
        }
    }
}
