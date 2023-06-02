//
//  Route.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/1/23.
//

import Foundation

enum Route: Hashable {
    case card(card: Card)
    case settings
    case results(scoreKeeper: ScoreKeeper)
    case uhOh(errorText: String)
}

extension Route: CustomStringConvertible {
    var description: String {
        switch self {
        case .card:
            return "A card"
        case .settings:
            return "Settings"
        case .results:
            return "Results"
        case .uhOh:
            return "UhOh"
        }
    }
}

extension Route {
    init(card: Card) {
        self = .card(card: card)
    }
}
