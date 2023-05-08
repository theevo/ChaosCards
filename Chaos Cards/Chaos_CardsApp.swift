//
//  Chaos_CardsApp.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

@main
struct Chaos_CardsApp: App {
    var body: some Scene {
        WindowGroup {
            CardListView(cards: Card.sampleCards)
        }
    }
}
