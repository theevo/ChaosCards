//
//  Choice.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/9/23.
//

import Foundation

struct Choice {
    let id = UUID()
    let rawValue: String
    let isCorrect: Bool
    
    init(_ string: String, isCorrect: Bool = false) {
        self.rawValue = string
        self.isCorrect = isCorrect
    }
}
