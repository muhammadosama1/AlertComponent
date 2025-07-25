//
//  Button.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 18/06/2025.
//

import SwiftUI

/// A customizable button component that follows the design system's visual guidelines.
///
/// The `Button` component provides a consistent way to create primary and secondary actions
/// throughout the application. It automatically handles different states like pressed and disabled.
///
/// Usage:
/// ```swift
/// Button(type: .primary, title: "Submit") {
///     // Handle action
/// }
/// .destructive() // Optional: applies destructive styling
/// ```
///
/// - Note: The button's appearance can be customized using environment values like `isDisabled`.
public struct Button: View {
    /// The visual style of the button.
    ///
    /// - `primary`: Used for main actions, typically with a filled background
    /// - `secondary`: Used for alternative actions, typically with an outlined style
    public enum ButtonType {
        case primary, secondary
    }
    
    private let type: ButtonType
    private let title: String
    private let action: () -> Void
    private var isDestructive: Bool = false
    
    /// Creates a new button with the specified type, title, and action.
    ///
    /// - Parameters:
    ///   - type: The visual style of the button (`.primary` or `.secondary`)
    ///   - title: The text to display on the button
    ///   - action: The closure to execute when the button is tapped
    public init(
        type: ButtonType,
        title: String,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.action = action
    }
    
    /// Applies a destructive style to the button.
    ///
    /// - Returns: A new button instance with destructive styling applied.
    public func destructive() -> Button {
        var copy = self
        copy.isDestructive = true
        return copy
    }
    
    /// The content and layout of the button.
    public var body: some View {
        SwiftUI.Button(title) {
            action()
        }
        .buttonStyle(CustomButtonStyle(type: type, isDestructive: isDestructive))
    }
}
