//
//  Choice.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Choice: Hashable {
    let id = UUID()
    let rawValue: String
    
    init(_ string: String) {
        self.rawValue = string
    }
}

extension Choice {
    init(card: Card) {
        self.init(card.answer)
    }
}
