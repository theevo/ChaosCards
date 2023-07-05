# Chaos Cards

## 07.05

EditMode | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/editmode

swiftui edit state array - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+edit+state+array&ie=UTF-8&oe=UTF-8

How to add custom swipe action buttons to a List row - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-custom-swipe-action-buttons-to-a-list-row

How to use SF Symbols in SwiftUI - Simple Swift Guide
https://www.simpleswiftguide.com/how-to-use-sf-symbols-in-swiftui/

How to enable editing on a list using EditButton - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-enable-editing-on-a-list-using-editbutton

SwiftUI and the Intermittent EditMode | by Michael Long | Geek Culture | Medium
https://medium.com/geekculture/swiftui-and-the-intermittent-editmode-b714c923f536

swiftui foreach index - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+foreach+index&ie=UTF-8&oe=UTF-8

swift - SwiftUI EditButton action on Done - Stack Overflow
https://stackoverflow.com/questions/57617524/swiftui-editbutton-action-on-done

onChange(of:perform:) | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/view/onchange(of:perform:)

swift - Best Way to Update/Edit an Array Element in SwiftUI - Stack Overflow
https://stackoverflow.com/questions/62106227/best-way-to-update-edit-an-array-element-in-swiftui

@State variable initialization in SwiftUI | Sarunw
https://sarunw.com/posts/state-variable-initialization/

What is the @Binding property wrapper? - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-binding-property-wrapper

SwiftUI Swipe Actions
https://useyourloaf.com/blog/swiftui-swipe-actions/

swift - Get index in ForEach in SwiftUI - Stack Overflow
https://stackoverflow.com/questions/57244713/get-index-in-foreach-in-swiftui

swift - SwiftUI - Indexset to index in array - Stack Overflow
https://stackoverflow.com/questions/59868180/swiftui-indexset-to-index-in-array

How to let users move rows in a list - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-move-rows-in-a-list

swift - Select all text in TextField upon click SwiftUI - Stack Overflow
https://stackoverflow.com/questions/67502138/select-all-text-in-textfield-upon-click-swiftui

animation - How can I animate individual rows in SwiftUI List? - Stack Overflow
https://stackoverflow.com/questions/69223787/how-can-i-animate-individual-rows-in-swiftui-list

swift - Insert, update and delete animations with ForEach in SwiftUI - Stack Overflow
https://stackoverflow.com/questions/61486483/insert-update-and-delete-animations-with-foreach-in-swiftui

How to make a TextField or TextEditor have default focus - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-a-textfield-or-texteditor-have-default-focus

How to style text views with fonts, colors, line spacing, and more - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-style-text-views-with-fonts-colors-line-spacing-and-more

How to create basic animations - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-basic-animations

SwiftUI: Animating Color Changes
https://trailingclosure.com/swiftui-animating-color-changes/

How to let users delete rows from a list - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-delete-rows-from-a-list

Create Button with Image in SwiftUI | Sarunw
https://sarunw.com/posts/swiftui-image-button/#renderingmode-modifier

swift - Is it possible to change "return" key to "done" on keyboard with SwiftUI? - Stack Overflow
https://stackoverflow.com/questions/60008549/is-it-possible-to-change-return-key-to-done-on-keyboard-with-swiftui

Displaying data in lists | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/displaying-data-in-lists

coredata sequential - Google Search
https://www.google.com/search?client=safari&rls=en&q=coredata+sequential&ie=UTF-8&oe=UTF-8#ip=1

core data - SwiftUI reorder CoreData Objects in List - Stack Overflow
https://stackoverflow.com/questions/59742218/swiftui-reorder-coredata-objects-in-list

Core Data: storing ordered values in a one-to-many relationship - Stack Overflow
https://stackoverflow.com/questions/69787646/core-data-storing-ordered-values-in-a-one-to-many-relationship

core data - SwiftUI reorder CoreData Objects in List - Stack Overflow
https://stackoverflow.com/questions/59742218/swiftui-reorder-coredata-objects-in-list

core data - SwiftUI reorder CoreData Objects in List - Stack Overflow
https://stackoverflow.com/questions/59742218/swiftui-reorder-coredata-objects-in-list

```swift
public class CoreItem: NSManagedObject, Identifiable{
    @NSManaged public var name: String
    @NSManaged public var userOrder: Int16
}

@FetchRequest( entity: CoreItem.entity(),
                   sortDescriptors:
                   [
                       NSSortDescriptor(
                           keyPath: \CoreItem.userOrder,
                           ascending: true),
                       NSSortDescriptor(
                           keyPath:\CoreItem.name,
                           ascending: true )
                   ]
    ) var coreItems: FetchedResults<CoreItem>

private func move( from source: IndexSet, to destination: Int) 
{
    // Make an array of items from fetched results
    var revisedItems: [ CoreItem ] = coreItems.map{ $0 }

    // change the order of the items in the array
    revisedItems.move(fromOffsets: source, toOffset: destination )

    // update the userOrder attribute in revisedItems to 
    // persist the new order. This is done in reverse order 
    // to minimize changes to the indices.
    for reverseIndex in stride( from: revisedItems.count - 1,
                                through: 0,
                                by: -1 )
    {
        revisedItems[ reverseIndex ].userOrder =
            Int16( reverseIndex )
    }
}
```

How to fix slow List updates in SwiftUI – Hacking with Swift
https://www.hackingwithswift.com/articles/210/how-to-fix-slow-list-updates-in-swiftui

init(_:id:rowContent:) | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/list/init(_:id:rowcontent:)-8x1ph


## 06.25

4 Picker styles in SwiftUI Form | Sarunw
https://sarunw.com/posts/swiftui-form-picker-styles/

The SwiftUI Equivalents to UICollectionView | by Mohd Hafiz | Better Programming
https://betterprogramming.pub/the-swiftui-equivalents-to-uicollectionview-60415e3c1bbe

How to use fetched (Core)Data in a Picker? – SwiftUI – Hacking with Swift forums
https://www.hackingwithswift.com/forums/swiftui/how-to-use-fetched-core-data-in-a-picker/3158

swift - SwiftUI pick a value from a list with ontap gesture - Stack Overflow
https://stackoverflow.com/questions/58500295/swiftui-pick-a-value-from-a-list-with-ontap-gesture

How to add section header and footer to SwiftUI list | Sarunw
https://sarunw.com/posts/swiftui-list-section-header-footer/

How to add custom swipe action buttons to a List row - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-custom-swipe-action-buttons-to-a-list-row

UUID | Apple Developer Documentation
https://developer.apple.com/documentation/foundation/uuid

Core Data and SwiftUI: a Solution | by Santiago Garcia Santos | Medium
https://medium.com/@santiagogarciasantos/core-data-and-swiftui-a-solution-c0404a01c1aa

How to filter Core Data fetch requests using a predicate - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-filter-core-data-fetch-requests-using-a-predicate

Learn & Master ⚔️ the Basics of Combine in 5 Minutes | by Sebastian Boldt | iOS App Development | Medium
https://medium.com/ios-os-x-development/learn-master-%EF%B8%8F-the-basics-of-combine-in-5-minutes-639421268219

Combine: Getting Started | Kodeco
https://www.kodeco.com/7864801-combine-getting-started#toc-anchor-005

Fetching Records With Core Data: Type Methods
https://cocoacasts.com/fetching-records-with-core-data-type-methods-in-swift

ios - Deleting CoreData from SwiftUI List with Sections - Stack Overflow
https://stackoverflow.com/questions/70399514/deleting-coredata-from-swiftui-list-with-sections


## 06.09

ios - How to resize Image with SwiftUI? - Stack Overflow
https://stackoverflow.com/questions/56505692/how-to-resize-image-with-swiftui

UNNotificationPresentationOptions | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationpresentationoptions

ios - How to listen to the changes in notification authorization Status - Stack Overflow
https://stackoverflow.com/questions/51394245/how-to-listen-to-the-changes-in-notification-authorization-status

The @FetchRequest property wrapper in SwiftUI
https://tanaschita.com/20210320-swiftui-fetchrequest-property-wrapper

Generating Code | Apple Developer Documentation
https://developer.apple.com/documentation/coredata/modeling_data/generating_code

ios - Class not found, using default NSManagedObject instead - Stack Overflow
https://stackoverflow.com/questions/25869231/class-not-found-using-default-nsmanagedobject-instead

ios - Unable to find specific subclass of NSManagedObject - Stack Overflow
https://stackoverflow.com/questions/25076276/unable-to-find-specific-subclass-of-nsmanagedobject

Configuring Relationships | Apple Developer Documentation
https://developer.apple.com/documentation/coredata/modeling_data/configuring_relationships

How to create NSManagedObject subsclasses for Core Data entities in Xcode
https://tanaschita.com/20221024-how-to-create-a-managed-object-subclass-xcode-core-data/

Get started with NSPredicate to filter NSFetchRequest in Core Data
https://tanaschita.com/20230320-cheatsheet-nspredicate-fetchrequest-core-data/

ios - Use Swift's Date with CoreData - Stack Overflow
https://stackoverflow.com/questions/39778111/use-swifts-date-with-coredata

loadPersistentStores(completionHandler:) | Apple Developer Documentation
https://developer.apple.com/documentation/coredata/nspersistentcontainer/1640568-loadpersistentstores

Configuring Relationships | Apple Developer Documentation
https://developer.apple.com/documentation/coredata/modeling_data/configuring_relationships

How to combine Core Data and SwiftUI - a free Hacking with iOS: SwiftUI Edition tutorial
https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui

Core Data Relationship in Swift 5— made simple | by Megi Sila | Medium
https://medium.com/@meggsila/core-data-relationship-in-swift-5-made-simple-f51e19b28326

Reduce array to set in Swift - Stack Overflow
https://stackoverflow.com/questions/34161786/reduce-array-to-set-in-swift

NSSet | Apple Developer Documentation
https://developer.apple.com/documentation/foundation/nsset

core data - Convert NSSet to Swift Array - Stack Overflow
https://stackoverflow.com/questions/24422831/convert-nsset-to-swift-array

Swift Logging - NSHipster
https://nshipster.com/swift-log/

Unified Logging and Activity Tracing - WWDC16 - Videos - Apple Developer
https://developer.apple.com/videos/play/wwdc2016/721/

Core Data: Basic knowledge & How-to | by Huy Vo | Medium
https://medium.com/@voxqhuy/core-data-basic-knowledge-how-to-7b8a306e58a0

FetchedResults | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/fetchedresults

Day55 – Making Previews work for DetailView – 100 Days of SwiftUI – Hacking with Swift forums
https://www.hackingwithswift.com/forums/100-days-of-swiftui/day55-making-previews-work-for-detailview/14794

Core Data Quick Start in SwiftUI
https://www.bigmountainstudio.com/view/downloads/core-data-quick-start

EnvironmentValues | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/environmentvalues

Every SwiftUI Environment Value explained | FIVE STARS
https://www.fivestars.blog/articles/swiftui-environment-values/

cocoa - Error with Swift and Core Data: fatal error: use of unimplemented initializer 'init(entity:insertIntoManagedObjectContext:)' - Stack Overflow
https://stackoverflow.com/questions/26202346/error-with-swift-and-core-data-fatal-error-use-of-unimplemented-initializer-i

How to enable editing on a list using EditButton - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-enable-editing-on-a-list-using-editbutton

How to show badge on List Row in SwiftUI | Sarunw
https://sarunw.com/posts/swiftui-list-row-badge/

4 Picker styles in SwiftUI Form | Sarunw
https://sarunw.com/posts/swiftui-form-picker-styles/

swiftui ondelete - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+ondelete&ie=UTF-8&oe=UTF-8#ip=1

coredata id - Google Search
https://www.google.com/search?client=safari&rls=en&q=coredata+id&ie=UTF-8&oe=UTF-8

How to delete Core Data objects from SwiftUI views - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-delete-core-data-objects-from-swiftui-views

core data - Convert NSSet to Swift Array - Stack Overflow
https://stackoverflow.com/questions/24422831/convert-nsset-to-swift-array

swift - Optional State or Binding in SwiftUI - Stack Overflow
https://stackoverflow.com/questions/66916454/optional-state-or-binding-in-swiftui

swift - How can I use Core Data value from picker? #SwiftUI #CoreData - Stack Overflow
https://stackoverflow.com/questions/67237434/how-can-i-use-core-data-value-from-picker-swiftui-coredata

ios - Conditional map function in Swift - Stack Overflow
https://stackoverflow.com/questions/58024401/conditional-map-function-in-swift

compactMap(_:) | Apple Developer Documentation
https://developer.apple.com/documentation/swift/sequence/compactmap(_:)


## 06.04

providesAppNotificationSettings | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationsettings/2990404-providesappnotificationsettings?language=objc

> Places a button at the bottom of your app's notifications settings screen WITHIN Settings.app.
> You should use UNUserNotificationCenter and request authorization for .providesAppNotificationSettings

```
UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound, .providesAppNotificationSettings])
```

> Then use UNUserNotificationCenterDelegate method for handling:

```
func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
    // Open settings view controller
}
```

init(path:root:) | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/navigationstack/init(path:root:)-3bt4q

Using Swift protocol delegation on a struct to change values? - Stack Overflow
https://stackoverflow.com/questions/62406749/using-swift-protocol-delegation-on-a-struct-to-change-values

Swift Generics Tutorial: Getting Started | Kodeco
https://www.kodeco.com/3535703-swift-generics-tutorial-getting-started

ios - Does not conform to protocol hashable? - Stack Overflow
https://stackoverflow.com/questions/68893073/does-not-conform-to-protocol-hashable

swift conform to stringprotocol - Google Search
https://www.google.com/search?client=safari&rls=en&q=swift+conform+to+stringprotocol&ie=UTF-8&oe=UTF-8

What’s the difference between @ObservedObject, @State, and @EnvironmentObject? - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject

objective c - Xcode - conditional development or production mode - Stack Overflow
https://stackoverflow.com/questions/12464386/xcode-conditional-development-or-production-mode

MapAnnotation SwiftUI Runtime Warn… | Apple Developer Forums
https://developer.apple.com/forums/thread/717478

How to present a new view using sheets - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets

swiftui - Are there maximum limits to VStack? - Stack Overflow
https://stackoverflow.com/questions/58397964/are-there-maximum-limits-to-vstack

Building a menu using List - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/building-a-menu-using-list

ios - Can not add subtitle to List item inside ForEach in Swift UI - Stack Overflow
https://stackoverflow.com/questions/61312248/can-not-add-subtitle-to-list-item-inside-foreach-in-swift-ui

How to align text center/leading/trailing in SwiftUI | Sarunw
https://sarunw.com/posts/how-to-align-text-in-swiftui/

ios - Fixing Xcode 9 issue: "iPhone is busy: Preparing debugger support for iPhone" - Stack Overflow
https://stackoverflow.com/questions/46316373/fixing-xcode-9-issue-iphone-is-busy-preparing-debugger-support-for-iphone

watchos - Xcode 13: Build hangs with "iPhone is busy: making Apple Watch ready for development" - Stack Overflow
https://stackoverflow.com/questions/69517131/xcode-13-build-hangs-with-iphone-is-busy-making-apple-watch-ready-for-develop


## 05.26

How to use programmatic navigation in SwiftUI - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-programmatic-navigation-in-swiftui

ios - Present modal view on navigation to another view in swiftui - Stack Overflow
https://stackoverflow.com/questions/72065186/present-modal-view-on-navigation-to-another-view-in-swiftui

tunds/SwiftUI-Navigation-Multiplatform-Example: This repo a 100% SwiftUI app showcasing examples of navigation, Multiplatform support & deep linking using the new NavigationStack & NavigationSplitView API's
https://github.com/tunds/SwiftUI-Navigation-Multiplatform-Example

Sheets in SwiftUI explained with code examples - SwiftLee
https://www.avanderlee.com/swiftui/presenting-sheets/

swiftui show view from appdelgate - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+show+view+from+appdelgate&ie=UTF-8&oe=UTF-8#ip=1

Using an AppDelegate with the new SwiftUI-based app lifecycle | Swift by Sundell
https://www.swiftbysundell.com/tips/using-an-app-delegate-with-swiftui-app-lifecycle/

ios - How to access own window within SwiftUI view? - Stack Overflow
https://stackoverflow.com/questions/60359808/how-to-access-own-window-within-swiftui-view

Understanding the difference between AppDelegate, SceneDelegate and SwiftUI's App protocol
https://tanaschita.com/20220404-understanding-the-difference-between-appdelegate-scenedelegate-and-swiftui-app-protocol/

ScenePhase | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/scenephase

Understanding Data Flow in SwiftUI | Kodeco
https://www.kodeco.com/11781349-understanding-data-flow-in-swiftui

Say Goodbye to SceneDelegate in SwiftUI | by Andrew Zheng | Better Programming
https://betterprogramming.pub/say-goodbye-to-scenedelegate-in-swiftui-444173b23015

swiftui launch view from didReceive response - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+launch+view+from+didReceive+response&ie=UTF-8&oe=UTF-8

SwiftUI by Example - free quick start tutorials for Swift developers
https://www.hackingwithswift.com/quick-start/swiftui

swiftui publish navigation stack - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+publish+navigation+stack&ie=UTF-8&oe=UTF-8

Type 'any View' cannot conform to 'View' - Google Search
https://www.google.com/search?client=safari&rls=en&q=Type+%27any+View%27+cannot+conform+to+%27View%27&ie=UTF-8&oe=UTF-8

> if you write a function that returns a View, you have to add @ViewBuilder to the beginning of the function

Method to return a generic View ty… | Apple Developer Forums
https://developer.apple.com/forums/thread/652844

ViewBuilder | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/viewbuilder

java - Encapsulation vs Abstraction? - Stack Overflow
https://stackoverflow.com/questions/8960918/encapsulation-vs-abstraction

App Store Connect
https://appstoreconnect.apple.com/apps/6449135765/testflight/ios

ios - Collect errors in Testflight - Stack Overflow
https://stackoverflow.com/questions/39475878/collect-errors-in-testflight


## 05.23

How to use programmatic navigation in SwiftUI - a free SwiftUI by Example tutorial
https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-programmatic-navigation-in-swiftui

ios - Present modal view on navigation to another view in swiftui - Stack Overflow
https://stackoverflow.com/questions/72065186/present-modal-view-on-navigation-to-another-view-in-swiftui

Sheets in SwiftUI explained with code examples - SwiftLee
https://www.avanderlee.com/swiftui/presenting-sheets/

swiftui show view from appdelgate - Google Search
https://www.google.com/search?client=safari&rls=en&q=swiftui+show+view+from+appdelgate&ie=UTF-8&oe=UTF-8#ip=1

Using an AppDelegate with the new SwiftUI-based app lifecycle | Swift by Sundell
https://www.swiftbysundell.com/tips/using-an-app-delegate-with-swiftui-app-lifecycle/

ios - How to access own window within SwiftUI view? - Stack Overflow
https://stackoverflow.com/questions/60359808/how-to-access-own-window-within-swiftui-view

Understanding the difference between AppDelegate, SceneDelegate and SwiftUI's App protocol
https://tanaschita.com/20220404-understanding-the-difference-between-appdelegate-scenedelegate-and-swiftui-app-protocol/

ScenePhase | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/scenephase

Understanding Data Flow in SwiftUI | Kodeco
https://www.kodeco.com/11781349-understanding-data-flow-in-swiftui

Say Goodbye to SceneDelegate in SwiftUI | by Andrew Zheng | Better Programming
https://betterprogramming.pub/say-goodbye-to-scenedelegate-in-swiftui-444173b23015

SwiftUI - Open a specific View when user opens a Push Notification - Stack Overflow
https://stackoverflow.com/questions/66283978/swiftui-open-a-specific-view-when-user-opens-a-push-notification

The Complete Guide to NavigationView in SwiftUI – Hacking with Swift
https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui

init(_:isActive:destination:) | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/navigationlink/init(_:isactive:destination:)-6xw7h

Migrating to new navigation types | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types

init(_:isActive:destination:) | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/navigationlink/init(_:isactive:destination:)-gn8q

Can't interpolate a Bool in SwiftU… | Apple Developer Forums
https://developer.apple.com/forums/thread/690479

LocalizedStringKey.StringInterpolation | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/localizedstringkey/stringinterpolation

Previewing Stateful SwiftUI Views - Interactive Previews for your SwiftUI views | Peter Friese
https://peterfriese.dev/posts/swiftui-previews-interactive/

constant(_:) | Apple Developer Documentation
https://developer.apple.com/documentation/swiftui/binding/constant(_:)

state vs binding - Google Search
https://www.google.com/search?client=safari&rls=en&q=state+vs+binding&ie=UTF-8&oe=UTF-8



## 05.22

Complying with Encryption Export Regulations | Apple Developer Documentation
https://developer.apple.com/documentation/security/complying_with_encryption_export_regulations

Xcode 13 Missing Info.plist
https://useyourloaf.com/blog/xcode-13-missing-info.plist/

UNMutableNotificationContent | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent

targetContentIdentifier | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent/3235763-targetcontentidentifier

UNNotificationContent | Apple Developer Documentation
https://developer.apple.com/documentation/usernotifications/unnotificationcontent

> NOT AN ISSUE
> 
> UNNotificationResponse.targetScene is of type UIScene, which is part of UIKit. I do not think this is makes sense for this SwiftUI app.
> 
> I thought I would use this property to tell the app which View to load, but I do not see a clear way to set this property in a UNMutableNotificationContent.


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

