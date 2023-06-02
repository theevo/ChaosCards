//
//  ResultsCellView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/2/23.
//

import SwiftUI

struct ResultsCellView: View {
    let item: ListItemViewModel
    
    var body: some View {
        HStack {
            Text(item.emoji)
            VStack {
                Text(item.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.subtitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct Incorrect_Previews: PreviewProvider {
    static var previews: some View {
        ResultsCellView(item: ListItemViewModel.incorrectSample)
            .border(.blue)
    }
}

struct Correct_Previews: PreviewProvider {
    static var previews: some View {
        ResultsCellView(item: ListItemViewModel.correctSample)
            .border(.blue)
    }
}
