//
//  SettingsView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/8/23.
//

import SwiftUI

enum NotificationFrequency: String, CaseIterable {
    case Seconds5 = "5 seconds"
    case Seconds10 = "10 seconds"
    case Minutes1 = "1 minute"
    case Minutes3 = "3 minutes"
    case Surprise = "Surprise me"
}

struct SettingsView: View {
    @State private var isNotificationsOn = false
    @State private var notificationFrequency: NotificationFrequency = .Seconds5
    var body: some View {
        Form {
            Section(footer: Text("When this is on, you'll receive push notifications. A multiple choice question will be sent for each card in your deck. Long press a notification to answer it.")) {
                Toggle(isOn: $isNotificationsOn.animation()) { Text("Notifications")
                }
            }
            if isNotificationsOn {
                Section {
                    Picker(
                        selection: $notificationFrequency,
                        label: Text("Quiz me every")
                    ) {
                        ForEach(NotificationFrequency.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    Button("Begin the quiz") {
                        print("Begin button tapped")
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
