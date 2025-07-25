//
//  Alert.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 15/06/2025.
//

import SwiftUI

/// A customizable alert component that follows the design system's visual guidelines.
///
/// The `AlertView` component provides a consistent way to display important messages
/// throughout the application. It supports different types of alerts, info sections, and custom actions.
///
/// Usage Example:
/// ```swift
/// AlertView(
///     title: "Update Available",
///     message: "A new version is ready to install",
///     alertType: .info,
///     infoSection: { /* Optional info section */ },
///     footer: { /* Action buttons */ }
/// )
/// ```
///
/// - Parameters:
///   - Footer: The type of the footer view, typically containing action buttons.
///   - InfoSection: The type of the info section view, for additional context (e.g., timer, disclaimer).
public struct AlertView<Footer: View, InfoSection: View>: View {
    private let alertTitle: String
    private let alertMessage: String
    private let alertType: AlertType
    private let alertInfoSection: InfoSection
    private let alertFooter: Footer
    
    /// Controls whether a border is shown around the alert, from the environment.
    @Environment(\.showBorder) var showBorder: Bool
    
    /// Creates a new alert view.
    ///
    /// - Parameters:
    ///   - title: The title text for the alert.
    ///   - message: The message text for the alert.
    ///   - alertType: The type of alert (success, warning, error, info).
    ///   - infoSection: A closure returning the info section view (optional).
    ///   - footer: A closure returning the footer view (typically action buttons).
    public init(
        title: String,
        message: String,
        alertType: AlertType,
        @AlertInfoSectionBuilder infoSection: () -> InfoSection,
        @ViewBuilder footer: @escaping () -> Footer
    ) {
        self.alertTitle = title
        self.alertMessage = message
        self.alertType = alertType
        self.alertInfoSection = infoSection()
        self.alertFooter = footer()
    }
    
    /// Creates a new alert view.
    ///
    /// - Parameters:
    ///   - title: The title text for the alert.
    ///   - message: The message text for the alert.
    ///   - alertType: The type of alert (success, warning, error, info).
    ///   - footer: A closure returning the footer view (typically action buttons).
    public init(
        title: String,
        message: String,
        alertType: AlertType,
        @ViewBuilder footer: @escaping () -> Footer
    ) where InfoSection == EmptyView {
        self.alertTitle = title
        self.alertMessage = message
        self.alertType = alertType
        self.alertInfoSection = EmptyView()
        self.alertFooter = footer()
    }
}

extension AlertView {
    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: 5
        ) {
            headingView
            
            Text(alertMessage)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            alertInfoSection
                .padding(.top, 10)
            
            alertFooter
                .padding(.top, 20)
        }
        .padding()
        .background(alertType.backgroundColor)
        .cornerRadius(12)
        .shadow(radius: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    alertType.tintColor,
                    lineWidth: showBorder ? 1 : 0
                )
        )
        .padding(.horizontal, 20)
        // Accessibility
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(alertType.rawValue) alert: \(alertTitle). \(alertMessage)")
        .accessibilityAddTraits(.isModal)
        .accessibilityHint(alertType.accessibilityHint)
    }
    
    /// The heading view, displaying the alert icon and title.
    var headingView: some View {
        HStack {
            Image(
                systemName: alertType.iconName
            )
            .foregroundStyle(alertType.tintColor)
            
            Text(alertTitle)
                .font(.headline)
                .fontWeight(.bold)
                .accessibilityAddTraits(.isHeader)
        }
    }
}

// MARK: - Previews

#Preview("Simple Alert") {
    // Example: Alert with two action buttons and no info section.
    AlertView(
        title: "Update Available",
        message: "A new version is ready to install",
        alertType: .info,
        infoSection: {
            // No info section for this preview
        },
        footer: {
            HStack {
                Button(type: .primary, title: "Update") {
                    // Handle delete action
                }
                Button(type: .secondary, title: "Cancel") {
                    // Handle cancel action
                }
            }
        }
    )
    .showBorder(true)
}

#Preview("With Info Section (TimerView)") {
    // Example: Alert with a timer info section and destructive actions.
    AlertView(
        title: "Delete Account",
        message: "Are you sure you want to delete your account? This action cannot be undone.",
        alertType: .error,
        infoSection: {
            
        },
        footer: {
            HStack {
                Button(type: .primary, title: "Delete") {
                    // Handle delete action
                }
                .destructive()
                Button(type: .secondary, title: "Cancel") {
                    // Handle cancel action
                }
                .destructive()
            }
        }
    )
}

#Preview("With Info Section (Disclaimer)") {
    // Example: Alert with a disclaimer info section and stacked action buttons.
    AlertView(
        title: "Data Usage Warning",
        message: "This action will download a large amount of content and may consume significant mobile data. Please ensure you have sufficient data allowance before proceeding.",
        alertType: .warning,
        infoSection: {
            Text("Data charges may apply based on your carrier plan. We recommend connecting to Wi-Fi to avoid additional costs. Large downloads may take several minutes to complete.")
        },
        footer: {
            VStack {
                Button(
                    type: .primary,
                    title: "Continue With Download"
                ) {
                    // Handle delete action
                }
                Button(type: .secondary, title: "Cancel") {
                    // Handle cancel action
                }
            }
        }
    )
}

#Preview("With Info Section (Disclaimer & TimerView)") {
    // Example: Alert with a disclaimer info section and stacked action buttons.
    AlertView(
        title: "Premium Feature Access",
        message: "This advanced analytics feature requires a premium subscription to access. You can try it now during your free trial period or upgrade to continue using it after the trial expires.",
        alertType: .info,
        infoSection: {
            Text("Premium features include advanced reporting, data export capabilities, and priority support. Your trial includes full access to all premium features with no limitations.")
            
            TimerView(targetDate: .now + 100)
        },
        footer: {
            VStack {
                Button(
                    type: .primary,
                    title: "Upgrade to Premium"
                ) {
                    // Handle delete action
                }
                Button(
                    type: .secondary,
                    title: "Continue with Trial"
                ) {
                    // Handle cancel action
                }
            }
        }
    )
}
