//
//  AlertType.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 24/06/2025.
//

import SwiftUI

/// Represents the type of alert to display, determining its color, icon, and accessibility hint.
public enum AlertType: String {
    /// A success alert, typically used for positive feedback.
    case success
    /// A warning alert, used for cautionary messages.
    case warning
    /// An error alert, used for error or failure messages.
    case error
    /// An informational alert, used for general information.
    case info
    
    /// The main tint color associated with the alert type.
    var tintColor: Color {
        switch self {
        case .success: return .green
        case .warning: return .yellow
        case .error: return .red
        case .info: return .blue
        }
    }
    
    /// The background color for the alert, with reduced opacity.
    public var backgroundColor: Color {
        tintColor.opacity(0.1)
    }

    /// An accessibility hint describing the alert type for assistive technologies.
    var accessibilityHint: String {
        switch self {
        case .info:
            return "This is an informational message"
        case .success:
            return "This is a success message"
        case .warning:
            return "This is a warning message"
        case .error:
            return "This is an error message"
        }
    }
    
    /// The name of the SF Symbol icon representing the alert type.
    var iconName: String {
        switch self {
        case .info:
            return "info.circle"
        case .success:
            return "checkmark"
        case .warning:
            return "exclamationmark.shield.fill"
        case .error:
            return "exclamationmark.triangle"
        }
    }
}
