# Chaos Cards

## 05.18

swift - Shared XCTest unit tests for different implementations of interface - Stack Overflow
https://stackoverflow.com/questions/34928632/shared-xctest-unit-tests-for-different-implementations-of-interface

Unit testing Swift code that uses async/await | Swift by Sundell
https://www.swiftbysundell.com/articles/unit-testing-code-that-uses-async-await/

Asynchronous Tests and Expectations | Apple Developer Documentation
https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations

Unit testing async/await Swift code - SwiftLee
https://www.avanderlee.com/concurrency/unit-testing-async-await/

MainActor usage in Swift explained to dispatch to the main thread
https://www.avanderlee.com/swift/mainactor-dispatch-main-thread/

Actors in Swift: how to use and prevent data races - SwiftLee
https://www.avanderlee.com/swift/actors/


## 05.17

Jonathan Ruiz (@refactoredd@mastodon.online) - iOS Dev Space
https://iosdev.space/@refactoredd@mastodon.online

How to Unit Test Enumerations in Swift | Quality Coding
https://qualitycoding.org/unit-test-enumerations-swift/

xctest something random order - Google Search
https://www.google.com/search?q=xctest+something+random+order&client=safari&rls=en&sxsrf=APwXEdeKpeyTAjNtAHY33_xOft0W5AjL_Q%3A1684354886047&ei=RjdlZP28ArTh0PEP9LC3oA0&ved=0ahUKEwj996H1lv3-AhW0MDQIHXTYDdQQ4dUDCA8&uact=5&oq=xctest+something+random+order&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCCEQoAEyBQghEKsCOgoIABBHENYEELADSgQIQRgAUI4HWJ4NYIUOaAFwAHgAgAGKAYgB0AWSAQMxLjWYAQCgAQHIAQi4AQPAAQE&sclient=gws-wiz-serp

Linear – A better way to build products
https://linear.app/

> Mikaela uses this to plan her apps

UNMutableNotificationContent | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent

Basic Operators | Documentation
https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/

unit test for randomness - Google Search
https://www.google.com/search?client=safari&rls=en&q=unit+test+for+randomness&ie=UTF-8&oe=UTF-8

ios - Find an object in array? - Stack Overflow
https://stackoverflow.com/questions/28727845/find-an-object-in-array


## 05.16

Chaos Cards

url | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationattachment/1649984-url

How to preview your layout in light and dark mode - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-preview-your-layout-in-light-and-dark-mode

Chaos Cards | Trello
https://trello.com/b/mQzwnEWa/chaos-cards

Restoring Your App’s State with SwiftUI | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/restoring_your_app_s_state_with_swiftui

View Implementations | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/table/view-implementations

How to make a SwiftUI view to fill its container width and height | Sarunw
https://sarunw.com/posts/how-to-make-swiftui-view-fill-container-width-and-height/

How to change SwiftUI font size | Sarunw
https://sarunw.com/posts/how-to-change-swiftui-font-size/

swiftui largest text - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+largest+text&ie=UTF-8&oe=UTF-8

How to use Dynamic Type with a custom font - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font

xcode - SwiftUI preview layout: size that fits does not work - Stack Overflow
https://stackoverflow.com/questions/74429078/swiftui-preview-layout-size-that-fits-does-not-work

You can preview your custom SwiftUI View without the iPhone or device frame.

Table | Apple Developer Documentation
https://developer.apple.com/documentation/SwiftUI/Table

Forget using a `Table()` on iPhone.

> You can define a single table for use on macOS, iOS, and iPadOS. However, in a compact horizontal size class environment — typical on iPhone or on iPad in certain modes, like Slide Over — the table has limited space to display its columns. To conserve space, the table automatically hides headers and all columns after the first when it detects this condition.


XCTUnwrap Optionals In Your Tests
https://useyourloaf.com/blog/xctunwrap-optionals-in-your-tests/


## 05.15

User Action Handler
https://docs.kii.com/en/guides/cloudsdk/ios/managing-push-notification/implementation/implementation-action/

> This confirmed that the `completionHandler()` provided as a param by `userNotificationCenter(_, didReceive response:, withCompletionHandler completionHandler)` does indeed need to be called by YOU.

mock UNNotificationResponse - Google Search
https://www.google.com/search?client=safari&rls=en&q=mock+UNNotificationResponse&ie=UTF-8&oe=UTF-8#cobssid=s

swift - Mock UNNotificationResponse & UNNotification (and other iOS platform classes with init() marked as unavailable) - Stack Overflow
https://stackoverflow.com/questions/47438257/mock-unnotificationresponse-unnotification-and-other-ios-platform-classes-wit

> I like the accepted answer.

> decompose your implementation of
> 
> `func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void)`
> 
> and test the methods you call from there, instead.
> 
> Happy testing :)

UNNotificationContent | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationcontent

Handling notifications and notification-related actions | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/handling_notifications_and_notification-related_actions

> userInfo property is a dictionary we can throw anything we want into!

> Apple confirms that the `completionHandler()` provided as a param by `userNotificationCenter(_, didReceive response:, withCompletionHandler completionHandler)` does indeed need to be called by YOU.

Declaring your actionable notification types | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/declaring_your_actionable_notification_types

userInfo | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent/1649867-userinfo

UNNotificationResponse | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationresponse

Testing error code paths in Swift | Swift by Sundell
https://www.swiftbysundell.com/articles/testing-error-code-paths-in-swift/

> Great breakdown of how to catch a thrown error in XCTest

XCTest Error Handling Improvements
https://useyourloaf.com/blog/xctest-error-handling-improvements/

xcode - How to unit test throwing functions in Swift? - Stack Overflow
https://stackoverflow.com/questions/32860338/how-to-unit-test-throwing-functions-in-swift

ios - Is there a better way to compare errors in Swift? - Stack Overflow
https://stackoverflow.com/questions/49658919/is-there-a-better-way-to-compare-errors-in-swift

> i don't want to conform my custom `Error` to Equatable because compiler forces me to define func == for this custom Error. I can still detect the exact error message as follows:
> 
> ```swift
> public enum AuthenticationError: Error {
    case unknownError
    case canceledByUser
    case userOrPasswordMismatch
    case unableToExtractOneTimeCode
    case unableToExchangeOneTimeCodeForToken
    case credentialsUnavailable
    case expired
    case webRequestFailed(error: Error)
}

func test(_ error: Error) {
    if case AuthenticationError.expired = error {
        print("it's expired; error = \(error)")
    } else if case AuthenticationError.webRequestFailed(error: let innerError) = error {
        print("web request failed due to \(innerError.localizedDescription); error = \(error)")
    } else {
        print("no match; error = \(error)")
    }
}

test(AuthenticationError.expired)
test(AuthenticationError.webRequestFailed(error: AuthenticationError.credentialsUnavailable))
test(NSError(domain: NSPOSIXErrorDomain, code: Int(ENOENT), userInfo: [:]))
> ```

swift Enum case is not a member of type '(any Error)?' - Google Search
https://www.google.com/search?client=safari&rls=en&q=swift+Enum+case+is+not+a+member+of+type+%27(any+Error)%3F%27&ie=UTF-8&oe=UTF-8

> This error is saying that you're trying to compare an error case against an optional error, which is true. Becuase the received error I defined was indeed optional. I worked around this by force casting it as I had previously verified beforehand that A) an error was indeed thrown and B) the error was of custom Error type I created.


## 05.12

XCTUnwrap Optionals In Your Tests
https://useyourloaf.com/blog/xctunwrap-optionals-in-your-tests/

unit test UNUserNotificationCenter getpendingnotificationrequests - Google Search

ios - Is UNUserNotification have option to show notification only on apple watch? - Stack Overflow
https://stackoverflow.com/questions/44626300/is-unusernotification-have-option-to-show-notification-only-on-apple-watch

Notifications | Apple Developer Documentation
https://developer.apple.com/documentation/watchos-apps/notifications/

UNMutableNotificationContent | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent

How to add custom actions for iOS push and local notifications
https://tanaschita.com/20220321-how-to-add-and-handle-actions-for-ios-notifications/

UNNotificationActionOptions | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationactionoptions

Handling local notification in SwiftUI - TechChee.com
https://blog.techchee.com/handling-local-notification-in-swiftui/

How to add an AppDelegate to a SwiftUI app - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app

How to perform action when user tap on push notification (foreground and background)
https://fluffy.es/perform-action-notification-tap/

How to Get Push Notification while iOS App is in Foreground | Sarunw
https://sarunw.com/posts/notification-in-foreground/

How to Store a Custom Object in User Defaults in Swift
https://cocoacasts.com/ud-5-how-to-store-a-custom-object-in-user-defaults-in-swift

How to configure Core Data to work with SwiftUI - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-configure-core-data-to-work-with-swiftui

Store array of custom object in CoreData | by Reza Farahani | Medium
https://medium.com/@rezafarahani/store-array-of-custom-object-in-coredata-bea77b9eb629

ios - How do you view TestFlight crash logs? - Stack Overflow
https://stackoverflow.com/questions/29728516/how-do-you-view-testflight-crash-logs

Core Data - One Entity has an array of another Entity – Swift – Hacking with Swift forums
https://www.hackingwithswift.com/forums/swift/core-data-one-entity-has-an-array-of-another-entity/3246

@State variable initialization in SwiftUI | Sarunw
https://sarunw.com/posts/state-variable-initialization/

One-to-many relationships with Core Data, SwiftUI, and @FetchRequest - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/one-to-many-relationships-with-core-data-swiftui-and-fetchrequest

State | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/state

Avoiding singletons in Swift | Swift by Sundell
https://www.swiftbysundell.com/articles/avoiding-singletons-in-swift/

swift - How does "public private(set)" access modifiers work? - Stack Overflow
https://stackoverflow.com/questions/37264824/how-does-public-privateset-access-modifiers-work

What’s the difference between @ObservedObject, @State, and @EnvironmentObject? - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject

swift - SwiftUI: Access @EnvironmentObject from AppDelegate - Stack Overflow
https://stackoverflow.com/questions/56693003/swiftui-access-environmentobject-from-appdelegate

Using Result type with async/await - Using Swift - Swift Forums
https://forums.swift.org/t/using-result-type-with-async-await/57003

Launch iOS simulator from Xcode and getting a black screen, followed by Xcode hanging and unable to stop tasks - Stack Overflow
https://stackoverflow.com/questions/14668445/launch-ios-simulator-from-xcode-and-getting-a-black-screen-followed-by-xcode-ha

What is a throwing function? - free Swift 5.4 example code and tips
https://www.hackingwithswift.com/example-code/language/what-is-a-throwing-function

Returning Error vs Throwing Error in Swift | by Jimmy Liu | Medium
https://medium.com/@kuopingl/returning-error-vs-throwing-error-in-swift-8d3657e1330d

What is @discardableResult | Sarunw
https://sarunw.com/posts/what-is-discardableresult/

class - How to use my @EnvironmentObject in AppDelegate in Swiftui (iOS 15 / Xcode 13.2.1)? - Stack Overflow
https://stackoverflow.com/questions/70815788/how-to-use-my-environmentobject-in-appdelegate-in-swiftui-ios-15-xcode-13-2

swift - Cannot convert value of type 'subSequence' (aka 'String.CharacterView') to type 'String' in collection - Stack Overflow
https://stackoverflow.com/questions/44078449/cannot-convert-value-of-type-subsequence-aka-string-characterview-to-type

How to get the first N elements of array in Swift | Sarunw
https://sarunw.com/posts/how-to-get-first-n-elements-of-swift-array/



## 05.11

Chaos Cards | Trello
https://trello.com/b/mQzwnEWa/chaos-cards

How to add custom actions for iOS push and local notifications
https://tanaschita.com/20220321-how-to-add-and-handle-actions-for-ios-notifications/

getNotificationCategories(completionHandler:) | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649504-getnotificationcategories

getPendingNotificationRequests(completionHandler:) | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649513-getpendingnotificationrequests

Customizing the Appearance of Notifications | Apple Developer Documentation
https://developer.apple.com/documentation/usernotificationsui/customizing_the_appearance_of_notifications

Unit testing Swift code that uses async/await | Swift by Sundell
https://www.swiftbysundell.com/articles/unit-testing-code-that-uses-async-await/

init(identifier:actions:intentIdentifiers:options:) | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationcategory/2196944-init

Scheduling local notifications - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications

unit test UNMutableNotificationContent - Google Search
https://www.google.com/search?client=safari&rls=en&q=unit+test+UNMutableNotificationContent&ie=UTF-8&oe=UTF-8#ip=1

How to mock UNNotificationResponse in unit tests | Swift Discovery
https://onmyway133.com/posts/how-to-mock-unnotificationresponse-in-unit-tests/

How to add bar items to a navigation view - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-bar-items-to-a-navigation-view

Asking permission to use notifications | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/asking_permission_to_use_notifications

How to Get Push Notification while iOS App is in Foreground | Sarunw
https://sarunw.com/posts/notification-in-foreground/

Scheduling local notifications - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications

Live Preview Window - Show/Hide? | Apple Developer Forums
https://developer.apple.com/forums/thread/665338

ios - receive local notifications within own app / view (or how to register a UNUserNotificationCenterDelegate in SwiftUI ) - Stack Overflow
https://stackoverflow.com/questions/65782435/receive-local-notifications-within-own-app-view-or-how-to-register-a-unuserno

How to add an AppDelegate to a SwiftUI app - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app

swift - How to solve this in Xcode16.2, Info.plist contained no UIScene configuration dictionary (looking for configuration named "(no name)") - Stack Overflow
https://stackoverflow.com/questions/74832242/how-to-solve-this-in-xcode16-2-info-plist-contained-no-uiscene-configuration-di

Unit testing iOS 10 notifications - Stack Overflow
https://stackoverflow.com/questions/40862551/unit-testing-ios-10-notifications

init(identifier:title:options:) | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationaction/1648195-init

Initialization | Documentation
https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/

Unique values in Swift: Removing duplicates from an array - SwiftLee
https://www.avanderlee.com/swift/unique-values-removing-duplicates-array/

Loop n times in Swift | Sarunw
https://sarunw.com/posts/swift-loop-n-times/

XCTUnwrap(_:_:file:line:) | Apple Developer Documentation
https://developer.apple.com/documentation/xctest/3380195-xctunwrap

How to check and unwrap optionals in tests using XCTUnwrap() - free Swift 5.4 example code and tips
https://www.hackingwithswift.com/example-code/testing/how-to-check-and-unwrap-optionals-in-tests-using-xctunwrap



## 05.08

Chaos Cards | Trello
https://trello.com/b/mQzwnEWa/chaos-cards

How to add custom actions for iOS push and local notifications
https://tanaschita.com/20220321-how-to-add-and-handle-actions-for-ios-notifications/

Scheduling local notifications - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications

How to add bar items to a navigation view - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-bar-items-to-a-navigation-view

Asking permission to use notifications | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/asking_permission_to_use_notifications

How to Get Push Notification while iOS App is in Foreground | Sarunw
https://sarunw.com/posts/notification-in-foreground/

Scheduling local notifications - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications

Live Preview Window - Show/Hide? | Apple Developer Forums
https://developer.apple.com/forums/thread/665338


## Undated

How to add text input actions to iOS push and local notifications
https://tanaschita.com/20220328-how-to-add-textinput-to-ios-notifications/

How to make a SwiftUI view to fill its container width and height | Sarunw
https://sarunw.com/posts/how-to-make-swiftui-view-fill-container-width-and-height/

Creating a card view — iOS App Dev Tutorials | Apple Developer Documentation
https://developer.apple.com/tutorials/app-dev-training/creating-a-card-view#Check-Your-Understanding

Designing a single card view - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/designing-a-single-card-view

Working with Identifiable items in SwiftUI - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/working-with-identifiable-items-in-swiftui

theevo/ChaosCards
https://github.com/theevo/ChaosCards

ScrollView | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/scrollview

SwiftUI Collection View: LazyVGrid and LazyHGrid
https://www.appcoda.com/swiftui-lazyvgrid-lazyhgrid/

How to use gestures in SwiftUI - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/how-to-use-gestures-in-swiftui

How to push a new view onto a NavigationStack - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-push-a-new-view-onto-a-navigationstack

How do you customize the NavigationStack in SwiftUI in 2023? | by Mark Moeykens | Medium
https://medium.com/@mark.moeykens/how-do-i-customize-the-navigationview-in-swiftui-ef90a530e1aa

How to customize the background of NavigationStack in SwiftUI in 2023?
https://www.bigmountainstudio.com/community/public/posts/80041-how-do-i-customize-the-navigationview-in-swiftui

Displaying a detail screen with NavigationLink - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/displaying-a-detail-screen-with-navigationlink

TextField | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/textfield

TextField in SwiftUI | Sarunw
https://sarunw.com/posts/textfield-in-swiftui/

Form | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/form

SwiftUI Form tutorial - how to create and use Form in SwiftUI - Simple Swift Guide
https://www.simpleswiftguide.com/swiftui-form-tutorial-how-to-create-and-use-form-in-swiftui/

What Is the Planet Mercury? | NASA
https://www.nasa.gov/audience/forstudents/k-4/stories/nasa-knows/what-is-planet-mercury-k4.html

How to create multiline TextField in SwiftUI | Sarunw
https://sarunw.com/posts/swiftui-multiline-textfield/

@State + didSet Property Observer | Apple Developer Forums
https://developer.apple.com/forums/thread/123357

onChange(of:perform:) | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/view/onchange(of:perform:)

SwiftUI @State var initialization issue - Stack Overflow
https://stackoverflow.com/questions/56691630/swiftui-state-var-initialization-issue

How to remove Back button title in SwiftUI | Sarunw
https://sarunw.com/posts/remove-back-button-title-in-swiftui/

