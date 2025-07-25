//
//  TimerView.swift
//  DesignSystemArticle
//
//  Created by Muhammad Osama on 18/07/2025.
//

import SwiftUI
import Combine

/// A view that displays a countdown timer until a target date.
///
/// The `TimerView` component shows the remaining time in minutes and seconds, updating every second.
/// Useful for deadlines, offers, or any time-based UI.
public struct TimerView: View {
    @State private var remainingSeconds: Int
    private let targetDate: Date
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    /// Creates a new timer view that counts down to the specified target date.
    ///
    /// - Parameter targetDate: The date to count down to.
    public init(
        targetDate: Date
    ) {
        self.targetDate = targetDate
        let initialSeconds = max(Int(targetDate.timeIntervalSinceNow), 0)
        self._remainingSeconds = State(initialValue: initialSeconds)
    }
    
    /// The content and layout of the timer view.
    public var body: some View {
        Text(timeString)
            .padding()
            .frame(maxWidth: .infinity)
            .font(.largeTitle)
            .fontWeight(.bold)
            .fontDesign(.monospaced)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
            .onReceive(timer) { _ in
                let seconds = max(Int(targetDate.timeIntervalSinceNow), 0)
                if remainingSeconds != seconds {
                    remainingSeconds = seconds
                }
            }
    }
    
    private var timeString: String {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
