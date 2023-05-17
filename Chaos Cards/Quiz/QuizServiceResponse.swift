//
//  QuizServiceResponse.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/16/23.
//

import Foundation

struct QuizServiceResponse {
    let title: String
    let subtitle: String
    let body: String
    let id = UUID()
}

extension QuizServiceResponse {
    static func makeResultsResponse(correct: Int, outOf: Int) -> QuizServiceResponse {
        QuizServiceResponse(
            title: QuizStrings.results,
            subtitle: "\(correct) out of \(outOf) correct",
            body: QuizStrings.tapToOpenApp)
    }
}
