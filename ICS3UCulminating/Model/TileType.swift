//
//  TileType.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import Foundation

// MARK: - TileType Enum
// This enum defines what can exist in each "square" of our grid.
// Using an enum makes the code easier to read than just using numbers.
enum TileType: Int {
    case wall = 0   // A barrier the player cannot pass through
    case path = 1   // A clear space where the player can walk
    case start = 2  // The starting point of the maze
    case exit = 3   // The goal point the player is trying to reach
}
