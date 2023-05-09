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
                Toggle("Notifications", isOn: $isNotificationsOn.animation())
                    .onChange(of: isNotificationsOn) { newValue in
                        guard newValue else { return }
                        
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
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
                        let content = UNMutableNotificationContent()
                        content.title = "Feed the cat"
                        content.subtitle = "It looks hungry"
                        content.sound = UNNotificationSound.default

                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
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
