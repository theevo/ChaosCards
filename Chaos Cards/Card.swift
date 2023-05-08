//
//  Card.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import Foundation

struct Card: Identifiable, Hashable {
    let id = UUID()
    let prompt: String
    let answer: String
}

extension Card {
    static var random: Card {
        return sampleCards.randomElement() ?? Card(prompt: "Sunday", answer: "wan aa-thit")
    }
    
    static var sampleCards: [Card] {
        return [
            Card(prompt: "Sunday", answer: "wan aa-thit"),
            Card(prompt: "Monday", answer: "wan jan"),
            Card(prompt: "Tuesday", answer: "wan ang-kaan"),
            Card(prompt: "Wednesday", answer: "wan phut"),
            Card(prompt: "Thursday", answer: "wan pha-rue-hat"),
            Card(prompt: "Friday", answer: "wan sook"),
            Card(prompt: "Saturday", answer: "wan sao"),
        ]
    }
    
    static var manySampleCards: [Card] {
        return (sampleCards + sampleCards + sampleCards).shuffled()
    }
}
