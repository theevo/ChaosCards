//
//  SettingsView.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/8/23.
//

import SwiftUI

enum NotificationStartsIn: String, CaseIterable {
    case Now = "Now"
    case Seconds5 = "5 seconds"
    case Minutes1 = "1 minute"
    case Minutes5 = "5 minutes"
    case Surprise = "Surprise me"
}

extension NotificationStartsIn {
    var timeInterval: TimeInterval {
        switch self {
        case .Now:
            return 0.1
        case .Seconds5:
            return 5
        case .Minutes1:
            return 60
        case .Minutes5:
            return 300
        case .Surprise:
            return surpriseValue
        }
    }
    
    var surpriseValue: TimeInterval {
        Double(Int.random(in: 600..<1800))
    }
}

struct SettingsView: View {
    @EnvironmentObject var quizService: QuizService
    @State private var isNotificationsOn = false
    @State private var startsIn: NotificationStartsIn = .Now
    
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
                        selection: $startsIn,
                        label: Text("Start quiz in")
                    ) {
                        ForEach(NotificationStartsIn.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    Button("Schedule the quiz") {
                        tappedScheduleButton()
                    }
                }
            }
        }
    }
    
    fileprivate func tappedScheduleButton() {
        Task {
            let service = quizService
            service.start()
            do {
                // TODO: - shouldn't .start() pop and send for us?
                try await service.popAndSend(in: startsIn.timeInterval)
                
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(QuizService(deck: Deck.example))
    }
}
