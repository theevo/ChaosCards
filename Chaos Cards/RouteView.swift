//
//  RouteView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/1/23.
//

import SwiftUI

struct UhOhView: View {
    var errorText: String
    var body: some View {
        VStack {
            Text("DM a screenshot of this for a coupon code https://iosdev.space/@theevo")
            Text("Error: \(errorText)")
        }
        .navigationTitle("Uh oh!")
    }
}

struct ResendQuestionView: View {
    @EnvironmentObject var quizService: QuizService
    
    var body: some View {
        Text("Greetings program")
        Text("current question: \(quizService.currentQuestion?.prompt ?? "nil")")
    }
}

struct RouteView: View {
    var route: Route
    
    var body: some View {
        switch route {
        case .card(let card):
            EditCardView(card: card)
        case .settings:
            SettingsView()
        case .results(let scoreKeeper):
            ResultsView(viewModel: ResultsViewModel(scoreKeeper: scoreKeeper))
        case .resendQuestion:
            ResendQuestionView()
        case .uhOh(let errorText):
            UhOhView(errorText: errorText)
        }
    }
}

struct RouteToCard_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(route: Route.card(card: Card.example))
    }
}

struct RouteToSettings_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(route: Route.settings)
    }
}

struct RouteToResults_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(route: Route.results(scoreKeeper: ScoreKeeper.sample))
    }
}

struct RouteToUhOh_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RouteView(route: Route.uhOh(errorText: "404"))
        }
    }
}
