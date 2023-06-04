//
//  ResendQuestionView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/4/23.
//

import SwiftUI

struct ResendQuestionView: View {
    @EnvironmentObject var quizService: QuizService
    
    var body: some View {
        VStack {
            Text("Questions are meant to be answered within each notification")
            Text("Long press notifications to reveal the answer choices")
            Button("Resend question") {
                print("resend question")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ResendQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let quizService = QuizService(deck: Deck.smallExample)
        ResendQuestionView()
            .environmentObject(quizService)
    }
}
