# AlertComponent

This Xcode project is the companion example for [Crafting SwiftUI Components for a Scalable Design System](https://medium.com/design-systems-collective/crafting-swiftui-components-for-a-scalable-design-system-51e88fed81f5). The article walks through turning a rigid alert into a composable SwiftUI component. This repository contains both the starting point and the resulting implementation.

## Follow the article

1. Open `AlertComponent.xcodeproj` in Xcode.
2. Read `AlertComponent/Alert/Legacy/LegacyAlertView.swift` for the starting component.
3. Read `AlertComponent/Alert/AfterUpdate/AlertView.swift` and its previews for the final component.
4. Explore `AlertComponent/Alert/AfterUpdate/AlertInfoSectionBuilder.swift` for the three guided info-section layouts: disclaimer, timer, or both.

The final alert keeps its title, message, and type in the initializer. A `@ViewBuilder` footer accepts custom actions, while the info-section builder applies the article's approved layouts. Use `.showBorder(true)` to enable the optional border.

```swift
AlertView(
    title: "Session Timeout",
    message: "Your session will expire soon.",
    type: .warning,
    infoSection: {
        TimerView(targetDate: .now + 120)
    },
    footer: {
        VStack {
            Button(type: .primary, title: "Extend Session") {
                // Handle extension
            }
            Button(type: .secondary, title: "Sign Out") {
                // Handle sign out
            }
        }
    }
)
.showBorder(true)
```

For an alert without an info section, omit `infoSection:` and provide the footer as the trailing closure. The previews in `AlertView.swift` show both forms.

The alert leaves the message, optional info section, and footer actions as separate accessibility elements so their content and controls remain available to VoiceOver. Callers should give any custom info content and actions meaningful labels or hints where needed.

## Contributing

Contributions that keep the example aligned with the article are welcome.

