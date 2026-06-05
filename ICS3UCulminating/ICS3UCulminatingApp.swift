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
    
    // We use an enum to track which screen the user is currently on.
    enum AppScreen {
        case start
        case modeSelection
        case game
    }
    
    @State private var currentScreen: AppScreen = .start
    
    // This will hold the game mode the user eventually picks.
    @State private var selectedMode: GameMode = .marathon
    
    // MARK: - Computed properties
    
    var body: some Scene {
        WindowGroup {
            switch currentScreen {
                
            case .start:
                StartView {
                    currentScreen = .modeSelection
                }
                
            case .modeSelection:
                ModeSelectionView { mode in
                    selectedMode = mode
                    currentScreen = .game
                }
                
            case .game:
                // We create the MazeViewModel with the mode the user picked!
                MazeView(viewModel: MazeViewModel(mode: selectedMode))
            }
        }
    }
}
