//
//  ButtonStyles.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 02/06/2025.
//

import SwiftUI

/// A custom button style that applies design system colors and shapes based on type and destructive state.
struct CustomButtonStyle: ButtonStyle {
    private let type: Button.ButtonType
    private let isDestructive: Bool
    private let buttonCornerRadius: CGFloat = 8
    
    /// Creates a new custom button style.
    /// - Parameters:
    ///   - type: The button type (primary or secondary).
    ///   - isDestructive: Whether the button is styled as destructive.
    init(
        type: Button.ButtonType,
        isDestructive: Bool = false
    ) {
        self.type = type
        self.isDestructive = isDestructive
    }
    
    /// Creates the styled button body.
    func makeBody(
        configuration: Configuration
    ) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(buttonCornerRadius)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .overlay(
                RoundedRectangle(cornerRadius: buttonCornerRadius)
                    .stroke(
                        overlayColor,
                        lineWidth: overlayLineWidth
                    )
            )
    }
    
    /// The background color for the button, based on type and destructive state.
    var backgroundColor: Color {
        switch type {
        case .primary:
            return isDestructive ? .red : .blue
        case .secondary:
            return .clear
        }
    }
    
    /// The foreground (text) color for the button.
    var foregroundColor: Color {
        switch type {
        case .primary:
            return .white
        case .secondary:
            return isDestructive ? .red : .blue
        }
    }

    /// The border color for outlined buttons.
    private var overlayColor: Color {
        switch type {
        case .secondary:
            return isDestructive ? .red : .blue
        default:
            return .clear
        }
    }

    /// The border width for outlined buttons.
    private var overlayLineWidth: CGFloat {
        type == .primary ? 0 : 1
    }
}
