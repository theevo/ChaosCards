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
                        label: Text("Start quiz in")
                    ) {
                        ForEach(NotificationFrequency.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    Button("Begin the quiz") {
                        print("Begin tapped")
                        Task {
                            let service = QuizService(deck: Deck.example)
                            service.setupQuestions()
                            do {
                                let question = try await service.popAndSend(in: 5)
                                print("question \(question.prompt) sent!")
                            } catch {
                                switch error {
                                case QuizService.ServiceError.NoMoreQuestions:
                                    print("no more questions")
                                case QuizService.ServiceError.NotificationCenter(let error):
                                    print("Error with Notification Center: \(error)")
                                default:
                                    print("Error no idea what went wrong: \(error)")
                                }
                            }
                        }
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
