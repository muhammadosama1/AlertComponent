# AlertComponent

A practical guide to transforming rigid SwiftUI components into flexible, composable building blocks that scale with your product needs.
The Problem

## Overview
In this Repo we transform a legacy component into declarative and scalable one 

```swift// ❌ Legacy: Overloaded initializer, hard to maintain
LegacyAlert(
    title: "Title", message: "Message", alertType: .info,
    showBorder: true, isDisabled: false,
    primaryButtonTitle: "Primary", secondaryButtonTitle: "Secondary",
    primaryAction: { }, secondaryAction: { }
)
```
The Solution
```swift// ✅ Modern: Composable, flexible, SwiftUI-native
AlertView(
    title: "Session Timeout",
    message: "Your session will expire in 2 minutes.",
    alertType: .warning,
    infoSection: {
        Text("Data charges may apply...")
        TimerView(targetDate: sessionEnd)
    },
    footer: {
        Button("Extend Session") { }
        Button("Sign Out") { }
    }
)
.showBorder(true)
```

## Key Techniques

@ViewBuilder for content injection
Environment values for clean configuration
@resultBuilder for guided composition
Built-in accessibility with proper responsibility separation

## Getting Started
1. Open `AlertComponent.xcodeproj` in Xcode
2. Explore the previews and code for usage examples ( AlertView & LegacyAlertView )

## Contributing
Contributions are welcome! Please open issues or pull requests for improvements, bug fixes, or new components.

