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
            Image("longpress")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("Long press notifications to reveal the answer choices")
            Spacer()
            Button("Resend question") {
                quizService.routesOnStack = []
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Quiz Paused")
    }
}

struct ResendQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let quizService = QuizService(deck: Deck.smallExample)
        NavigationStack {
            ResendQuestionView()
                .environmentObject(quizService)
        }
    }
}
