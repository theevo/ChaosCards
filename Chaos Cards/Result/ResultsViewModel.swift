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
    
    init(right: Int = 0, outOf: Int = 0) {
        self.right = right
        self.outOf = outOf
    }
    
    var title: String {
        "\(right) out of \(outOf) correct"
    }
}
