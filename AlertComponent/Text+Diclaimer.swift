//
//  View+Extension.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 20/07/2025.
//

import SwiftUI

/// Adds a disclaimer style to Text
extension Text {
    /// Styles the Text as a disclaimer, with padding, background, border, and caption font.
    /// - Returns: A view styled as a disclaimer.
    func disclaimerStyle() -> some View {
        self
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.yellow.opacity(0.05))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        .yellow,
                        lineWidth: 0.5
                    )
            )
            .font(.caption)
    }
}
