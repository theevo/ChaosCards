//
//  CardView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/6/23.
//

import SwiftUI

struct CardView: View {
    let viewModel: CardViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(
                cornerRadius: 45,
                style: .continuous
            )
                .fill(.background)
                .shadow(color: .secondary, radius: 10)
            VStack {
                Text(viewModel.largeTitle)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                
                Text(viewModel.title1)
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
        let viewModel = CardViewModel(card: Card.example)
        
        CardView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
