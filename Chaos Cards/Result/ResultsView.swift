//
//  ResultsView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 6/1/23.
//

import SwiftUI

struct ResultsView: View {
    let viewModel: ResultsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.largeTitle)
            List {
                ForEach(viewModel.items) { item in
                    ResultsCellView(item: item)
                }
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(viewModel: ResultsViewModel.sample)
    }
}
