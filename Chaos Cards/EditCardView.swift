//
//  EditCardView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/8/23.
//

import SwiftUI

struct EditCardView: View {
    @State private var prompt: String = ""
    @State private var answer: String = ""
    var card: Card
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Prompt")) {
                    TextField(text: $prompt) {
                    }
                }
                Section {
                    Button("Switch places") {
                        print("switch button pressed")
                    }
                }
                Section(header: Text("Answer")) {
                    TextField(text: $answer) {
                        
                    }
                }
            }
            .navigationTitle("Edit card")
        }
    }
}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardView(card: Card.random)
    }
}
