//
//  OldComponent.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 18/06/2025.
//

import SwiftUI

/// A legacy alert view for displaying messages and actions.
///
/// This component is deprecated and replaced by `AlertView`. It supports a title, message, alert type, and primary/secondary actions.
struct LegacyAlertView: View {
    let title: String
    let message: String
    let alertType: AlertType
    let showBorder: Bool
    let primaryButtonTitle: String
    let secondaryButtonTitle: String?
    let primaryAction: () -> Void
    let secondaryAction: (() -> Void)?
    
    /// The type of alert, determining its color and icon.
    enum AlertType {
        case success, warning, error, info
    }
    
    /// The color associated with the alert type.
    var typeColor: Color {
        switch alertType {
        case .success: return .green
        case .warning: return .yellow
        case .error: return .red
        case .info: return .blue
        }
    }
    
    /// The content and layout of the legacy alert view.
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text(title)
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                Spacer()
                    .frame(height: 25)
                Button(
                    type: .primary,
                    title: primaryButtonTitle, action: primaryAction
                )
                if let secondaryTitle = secondaryButtonTitle, let secondaryAction = secondaryAction {
                    Button(
                        type: .secondary,
                        title: secondaryTitle,
                        action: secondaryAction
                    )
                }
            }
        }
        .padding()
        .background(typeColor.opacity(0.1))
        .cornerRadius(12)
        .shadow(radius: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    typeColor.opacity(0.4),
                    lineWidth: 1
                )
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    LegacyAlertView(
        title: "Title",
        message: "Description Message goes here",
        alertType: .info,
        showBorder: true,
        primaryButtonTitle: "Primary Action",
        secondaryButtonTitle: "Secondary Action",
        primaryAction: {
            // Primary button action
        }, secondaryAction: {
            // Secondary button action
        }
    )
    
    LegacyAlertView(
        title: "Title",
        message: "Description Message goes here",
        alertType: .info,
        showBorder: true,
        primaryButtonTitle: "Primary Action",
        secondaryButtonTitle: "Secondary Action",
        primaryAction: {
            // Primary button action
        }, secondaryAction: {
            // Secondary button action
        }
    )
}
