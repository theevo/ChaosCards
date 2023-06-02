//
//  ListItemViewModel.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/2/23.
//

import Foundation

struct ListItemViewModel: Identifiable {
    let id = UUID()
    let title: String
    let title2: String
    let subtitle: String
    let correct: Bool
    
    var emoji: String {
        correct ? "✅" : "❗️"
    }
    
    var hasSubtitle: Bool {
        !correct
    }
}

extension ListItemViewModel {
    static let incorrectSample: ListItemViewModel = ListItemViewModel(
        title: "Tuesday",
        title2: "wan-aang-kan",
        subtitle: "you answered: wan phut",
        correct: false)
    static let correctSample: ListItemViewModel = ListItemViewModel(
        title: "Tuesday",
        title2: "wan-aang-kan",
        subtitle: "",
        correct: true)
    static let samples: [ListItemViewModel] = (
        Array(repeating: ListItemViewModel.incorrectSample, count: 10) +
        Array(repeating: correctSample, count: 3)).shuffled()
}
