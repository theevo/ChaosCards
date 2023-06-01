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

struct RouteView: View {
    var route: Route
    
    var body: some View {
        switch route {
        case .card(let card):
            EditCardView(card: card)
        case .settings:
            SettingsView()
        case .results:
            ResultsView(viewModel: ResultsViewModel())
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
        RouteView(route: Route.results)
    }
}

struct RouteToUhOh_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RouteView(route: Route.uhOh(errorText: "404"))
        }
    }
}
