//
//  ResultsViewModel.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/1/23.
//

import Foundation

struct ResultsViewModel {
    let right: Int
    let outOf: Int
    let items: [ListItemViewModel]
    
    init(right: Int, outOf: Int, items: [ListItemViewModel]) {
        self.right = right
        self.outOf = outOf
        self.items = items
    }
    
    init(scoreKeeper: ScoreKeeper) {
        self.right = scoreKeeper.score
        self.outOf = scoreKeeper.outOf
        self.items = scoreKeeper.answers.map { $0.listItemViewModel }
    }
    
    var title: String {
        "\(right) out of \(outOf) correct"
    }
}

extension ResultsViewModel {
    static let sample = ResultsViewModel(
        right: 3,
        outOf: 13,
        items: ListItemViewModel.samples)
}

extension QuizUserAnswer {
    var listItemViewModel: ListItemViewModel {
        ListItemViewModel(
            title: prompt,
            title2: correct,
            subtitle: "you answered: \(answered)",
            correct: isCorrect)
    }
}
