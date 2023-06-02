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
