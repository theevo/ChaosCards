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
                Group {
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("❗️ Tuesday = wan-ang-kan\n you answered: 🚫 wan phut 🚫")
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan\n you answered: wan phut")
                }
                Group {
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan\n you answered: wan phut")
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                }
                Group {
                    Text("✅ Tuesday = wan-ang-kan")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                    Text("🚫 Tuesday = wan-ang-kan, not wan phut")
                }
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(viewModel: ResultsViewModel(right: 3, outOf: 13))
    }
}
