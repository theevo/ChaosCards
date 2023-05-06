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
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.background)
                .shadow(radius: 10)
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding(20)
        }
        
        //        VStack(alignment: .leading) {
        //            Text("Wednesday")
        //                .font(.largeTitle)
        //                .accessibilityAddTraits(.isHeader)
        //            Text("wan phut")
        //                .font(.title)
        //        }
        //        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.random)
    }
}
