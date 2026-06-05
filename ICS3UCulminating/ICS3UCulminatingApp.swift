//
//  ICS3UCulminatingApp.swift
//  ICS3UCulminating
//
//  Created by Tomás Elosua Cajigas on 2026-06-01.
//

import SwiftUI

@main
struct ICS3UCulminatingApp: App {
    
    // MARK: - Stored properties
    
    // This state variable tracks whether the game has started or not.
    // When it is 'false', we show the StartView.
    // When it is 'true', we show the MazeView.
    @State private var gameStarted = false
    
    // MARK: - Computed properties
    
    var body: some Scene {
        WindowGroup {
            if gameStarted {
                // If the game has started, show the main maze screen
                MazeView()
            } else {
                // If the game hasn't started, show the aesthetic splash screen
                StartView {
                    // This is the code that runs when the "Start Game" button is tapped
                    gameStarted = true
                }
            }
        }
    }
}
