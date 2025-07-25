//
//  AlertComponentApp.swift
//  AlertComponent
//
//  Created by Muhammad Osama on 25/07/2025.
//

import SwiftUI

@main
struct AlertComponentApp: App {
    var body: some Scene {
        WindowGroup {
            AlertView(
                title: "Title",
                message: "Description Message",
                alertType: .info
            ) {
                VStack {
                    VStack {
                        Button(
                            type: .primary,
                            title: "Primary Action"
                        ) {
                            // Handle primary action
                        }
                        Button(
                            type: .secondary,
                            title: "Secondary Action"
                        ) {
                            // Handle secondary action
                        }
                    }
                }
            }
        }
    }
}
