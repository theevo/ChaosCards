//
//  CardViewModel.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/16/23.
//

import Foundation

struct CardViewModel {
    var largeTitle: String
    var title1: String
    // var title2: String?
}

extension CardViewModel {
    init(card: Card) {
        self.largeTitle = card.prompt
        self.title1 = card.answer
    }
}
