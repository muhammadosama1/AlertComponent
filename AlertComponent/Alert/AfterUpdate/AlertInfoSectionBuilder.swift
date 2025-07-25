//
//  AlertFooterResultBuilder.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 02/06/2025.
//

import SwiftUI

/// A result builder for constructing info sections in alerts.
@resultBuilder
public struct AlertInfoSectionBuilder {
    
    /// Builds an empty info section.
    ///
    /// - Returns: An empty view. Use when no info section is needed.
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// Builds an info section with a disclaimer text.
    ///
    /// - Parameter disclaimer: A `Text` view representing the disclaimer or informational message to display.
    /// - Returns: The styled disclaimer view.
    public static func buildBlock(
        _ disclaimer: Text
    ) -> some View {
        disclaimer
            .disclaimerStyle()
    }
    
    /// Builds an info section with a timer view.
    ///
    /// - Parameter timer: A `TimerView` instance to display a countdown or time-based info.
    /// - Returns: The timer view.
    public static func buildBlock(
        _ timer: TimerView
    ) -> some View {
        timer
    }
    
    /// Builds an info section with both a disclaimer and a timer view.
    ///
    /// - Parameters:
    ///   - disclaimer: A `Text` view for the disclaimer or info message.
    ///   - timer: A `TimerView` to display a countdown or time-based info.
    /// - Returns: A vertical stack containing both the disclaimer and the timer.
    public static func buildBlock(
        _ disclaimer: Text,
        _ timer: TimerView
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            disclaimer
                .disclaimerStyle()
            
            timer
        }
    }
}
