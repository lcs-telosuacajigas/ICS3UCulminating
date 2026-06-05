//
//  GameMode.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import Foundation

// MARK: - GameMode Enum
// This enum allows us to switch between the two different ways of playing.
enum GameMode {
    // marathon: The original 10 levels with custom time limits.
    case marathon
    
    // endless: Procedurally generated levels that go on forever with a 6s timer.
    case endless
}
