//
//  QuizService.swift
//  Chaos Cards
//
//  Created by Theo Vora on 5/12/23.
//

import Foundation
import UserNotifications

/// QuizService is the interface between the NotificationCenter and an active Quiz.
/// - delivers Quiz questions via Local Notificaiton
/// - receives incoming actions from NotificationCenter and dispatches them accordingly
/// - *QUESTION*: is it responsible for INTERPRETING what the actions mean?
class QuizService: ObservableObject {
    @Published var routesOnStack: [Route] = []
    
    let deck: Deck
    var quiz: Quiz
    var response: UNNotificationResponse?
    var notificationCenter: UNUserNotificationCenter?
    private(set) var state: QuizSequence = QuizSequence()
    private(set) var scoreKeeper = ScoreKeeper()
    private(set) var deckManager = DeckManager()
    var action: QuizAction?
    
    var currentQuestion: Question? {
        quiz.currentQuestion
    }
    
    var remainingQuestions: [Question] {
        quiz.remainingQuestions
    }
    
    /// Creates a QuizService based on the Deck. `.start()` will create exactly the same number of multiple-choice questions as the number of cards in the deck. Questions will be randomized.
    /// - Parameter deck: deck can have 1 or more cards
    init(
        deck: Deck,
        notificationCenter: UNUserNotificationCenter? = nil
    ) {
        self.deck = deck
        self.quiz = Quiz(deck: deck)
        self.notificationCenter = notificationCenter
    }
}

extension QuizService {
    enum ServiceError: Error {
        case NoMoreQuestions
        case NotificationCenter(Error)
        // TODO: - better name: CurrentQuestionNotSet?
        case CurrentQuestionNil
    }
    
    enum QuizAction {
        case BannerWasLongPressed
        case Correct
        case Incorrect
        case ShowResults
    }
    
    enum QuizSequence {
        case notstarted
        case playing
        case result
        
        init() {
            self = .notstarted
        }
        
        mutating func next() {
            switch self {
            case .notstarted:
                self = .playing
            case .playing:
                self = .result
            default:
                return
            }
        }
    }
}

extension QuizService {
    func choice(id: String) -> Choice? {
        quiz.allChoices.first { $0.id.uuidString == id }
    }
    
    func sendNextQuestion() throws {
        try popAndSend(in: 0.1)
    }
    
    func handle(response: UNNotificationResponse) {
        do {
            self.response = response
            try handle(actionIdentifier: response.actionIdentifier)
        } catch {
            print(error)
        }
    }
    
    internal func handleBannerTap(actionIdentifier: String) {
        if response?.notification.request.content.targetContentIdentifier == QuizStrings.screenGetResults {
            print("🌈 Show the results banner!")
            self.action = .ShowResults
            self.response = nil
            routesOnStack.append(.results(scoreKeeper: scoreKeeper))
        } else {
            print("you tapped on the banner of a quiz question, silly")
            self.action = .BannerWasLongPressed
            self.response = nil
            routesOnStack = [.resendQuestion]
        }
    }
    
    fileprivate func recordAnswer(_ actionIdentifier: String, _ currentQuestion: Question) {
        let userChoice = choice(id: actionIdentifier)
        scoreKeeper.logAnswer(question: currentQuestion, userChoice: userChoice)
        
        if actionIdentifier == currentQuestion.correctChoice.id.uuidString {
            self.action = .Correct
        } else {
            self.action = .Incorrect
        }
    }
    
    fileprivate func sendResults() {
        state.next() // .results
        sendResultsNotification()
    }
    
    private func sendNextNotification() {
        guard state == .playing else { return }
        
        do {
            try sendNextQuestion()
        } catch {
            switch error {
            case QuizService.ServiceError.NoMoreQuestions:
                sendResults()
            default:
                return
            }
        }
    }
    
    internal func handle(actionIdentifier: String) throws {
        guard actionIdentifier != QuizStrings.userTappedBanner else {
            handleBannerTap(actionIdentifier: actionIdentifier)
            return
        }
        
        guard let currentQuestion = currentQuestion else {
            throw ServiceError.CurrentQuestionNil
        }
        
        recordAnswer(actionIdentifier, currentQuestion)
        
        sendNextNotification()
    }
    
    func pop() -> Question? {
        guard let question = quiz.pop() else { return nil }
        
        return question
    }
    
    func popAndSend(in seconds: TimeInterval) throws {
        guard let question = pop() else { throw ServiceError.NoMoreQuestions }
        
        Task { try await send(question: question, seconds: seconds) }
    }
    
    public func sendCurrentQuestion() {
        guard let currentQuestion = currentQuestion else { return }
        
        Task { try await send(question: currentQuestion, seconds: 0.1) }
    }
    
    fileprivate func send(question: Question, seconds: TimeInterval) async throws {
        // send the notification
        await question.registerNotificationCategory(center: notificationCenter)
        
        let content = UNMutableNotificationContent(question: question)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        do {
            try await notificationCenter?.add(request)
            print("question \(question.prompt) sent!")
        } catch {
            throw ServiceError.NotificationCenter(error)
        }
    }
    
    fileprivate func resetScoreKeeper() {
        scoreKeeper = ScoreKeeper()
    }
    
    fileprivate func sendResultsNotification() {
        print("✈️✈️✈️ sending Results Notification!")
        
        let response = QuizServiceResponse.makeResultsResponse(correct: scoreKeeper.score, outOf: scoreKeeper.outOf)
        let content = UNMutableNotificationContent(quizServiceResponse: response)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: "asdf", content: content, trigger: trigger)
        
        notificationCenter?.add(request)
    }
    
    public func start(numberOfWrongChoices: UInt = 2) {
        reset()
        quiz.setQuestions(numberOfWrongChoices: numberOfWrongChoices)
        state.next()
    }
    
    public func reset() {
        resetState()
        resetScoreKeeper()
    }
    
    private func resetState() {
        state = QuizSequence()
    }
}
