//
//  CardListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

struct CardListView: View {
    @EnvironmentObject var quizService: QuizService
    @EnvironmentObject var deckManager: DeckManager
    
    var body: some View {
        NavigationStack(path: $quizService.routesOnStack) {
            ScrollView {
                VStack {
                    ForEach(deck.cards) { card in
                        NavigationLink(value: card.route) {
                            let viewModel = CardViewModel(card: card)
                            CardView(viewModel: viewModel)
                        }
                    }
                }
            }
            .navigationTitle(deck.name)
            .navigationDestination(for: Route.self) { route in
                RouteView(route: route)
                    .toolbarRole(.editor)
            }
            .toolbar {
                NavigationLink("Settings") {
                    SettingsView()
                        .toolbarRole(.editor)
                        .environmentObject(quizService)
                }
            }
        }
    }
}

extension CardListView {
    var deck: Deck {
        print("🂡 CardList will load this deck id:", deckManager.activeDeckIdString.suffix(4))
        return quizService.deck
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        let quizService = QuizService(deck: Deck.example)
        CardListView()
            .environmentObject(quizService)
    }
}
