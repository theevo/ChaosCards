//
//  CardListView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

struct CardListView: View {
    @EnvironmentObject var quizService: QuizService
    @State private var path: [Card] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    ForEach(deck.cards) { card in
                        NavigationLink(value: card) {
                            let viewModel = CardViewModel(card: card)
                            CardView(viewModel: viewModel)
                        }
                    }
                }
            }
            .navigationTitle(deck.name)
            .navigationDestination(for: Card.self) { card in
                EditCardView(card: card)
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
        quizService.deck
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        let quizService = QuizService(deck: Deck.example)
        CardListView()
            .environmentObject(quizService)
    }
}
