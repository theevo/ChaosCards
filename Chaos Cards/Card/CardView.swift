//
//  CardView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var body: some View {
        ZStack {
            RoundedRectangle(
                cornerRadius: 25,
                style: .continuous
            )
                .fill(.background)
                .shadow(color: .secondary, radius: 10)
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            .padding([.top, .bottom], 42)
        }
        .padding([.leading, .trailing])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
