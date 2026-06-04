//
//  Maze.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import Foundation

// MARK: - TileType Enum
// This enum defines what can exist in each "square" of our grid.
enum TileType: Int {
    case wall = 0   // A barrier the player cannot pass through
    case path = 1   // A clear space where the player can walk
    case start = 2  // The starting point of the maze
    case exit = 3   // The goal point the player is trying to reach
}

// MARK: - Player Struct
// This keeps track of where the player is located on the grid.
struct Player {
    var row: Int
    var column: Int
}

// MARK: - Maze Struct
// This structure holds all the data for a single level.
struct Maze {
    
    // MARK: - Stored properties
    let grid: [[TileType]]
    let startPosition: Player
    let exitPosition: Player
    
    // How many seconds the player has to complete this specific level.
    let timeLimit: Int
    
    // The exact number of moves required to reach the exit.
    // NOTE: Update these values manually after testing the levels!
    let optimalMoves: Int
    
    // MARK: - Computed properties
    var rowCount: Int {
        return grid.count
    }
    
    var columnCount: Int {
        if grid.isEmpty {
            return 0
        } else {
            return grid[0].count
        }
    }
}

// MARK: - Levels Data
// These are the original layouts. 
// You can manually count and update the 'optimalMoves' for each.
let mazeLevels: [Maze] = [
    // Level 1: Introduction
    Maze(
        grid: [
            [.wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall],
            [.wall,  .start, .path,  .path,  .wall,  .path,  .path,  .path,  .path,  .wall],
            [.wall,  .wall,  .wall,  .path,  .wall,  .path,  .wall,  .wall,  .path,  .wall],
            [.wall,  .path,  .path,  .path,  .path,  .path,  .path,  .wall,  .path,  .wall],
            [.wall,  .path,  .wall,  .wall,  .wall,  .wall,  .path,  .wall,  .path,  .wall],
            [.wall,  .path,  .path,  .path,  .path,  .wall,  .path,  .path,  .path,  .wall],
            [.wall,  .wall,  .wall,  .wall,  .path,  .wall,  .wall,  .wall,  .path,  .wall],
            [.wall,  .path,  .path,  .path,  .path,  .path,  .path,  .path,  .path,  .wall],
            [.wall,  .path,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .exit,  .wall],
            [.wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 8, column: 8),
        timeLimit: 10,
        optimalMoves: 14 // Placeholder: Verify and Update
    ),
    
    // Level 2: The S-Curve
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .start, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .exit, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 8, column: 8),
        timeLimit: 10,
        optimalMoves: 28 // Placeholder: Verify and Update
    ),
    
    // Level 3: The Fork in the Road
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .start, .path, .path, .path, .wall, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .path, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .wall, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .exit, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 8, column: 8),
        timeLimit: 9,
        optimalMoves: 20 // Placeholder: Verify and Update
    ),
    
    // Level 4: The Spiral
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .start, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .path, .wall, .path, .path, .path, .exit, .wall, .wall, .wall],
            [.wall, .path, .wall, .path, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 5, column: 6),
        timeLimit: 9,
        optimalMoves: 27 // Placeholder: Verify and Update
    ),
    
    // Level 5: The Grid Lock
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .start, .path, .wall, .path, .path, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .wall, .path, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .wall, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .path, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .wall, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .wall, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .exit, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 8, column: 8),
        timeLimit: 8,
        optimalMoves: 18 // Placeholder: Verify and Update
    ),
    
    // Level 6: The Zig-Zag
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .start, .path, .wall, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .path, .wall, .path, .wall, .wall, .wall, .path, .wall],
            [.wall, .wall, .path, .wall, .path, .wall, .exit, .wall, .path, .wall],
            [.wall, .wall, .path, .wall, .path, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 3, column: 6),
        timeLimit: 8,
        optimalMoves: 11 // Placeholder: Verify and Update
    ),
    
    // Level 7: The Box Room
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .start, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .path, .path, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .wall, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .wall, .exit, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 5, column: 5),
        timeLimit: 7,
        optimalMoves: 18 // Placeholder: Verify and Update
    ),
    
    // Level 8: The Diamond Chamber
    Maze(
        grid: [
            [.wall, .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall],
            [.wall, .start, .path,  .path,  .path,  .path,  .path,  .path,  .path,  .wall],
            [.wall, .path,  .wall,  .wall,  .wall,  .path,  .wall,  .wall,  .path,  .wall],
            [.wall, .path,  .wall,  .path,  .path,  .path,  .path,  .wall,  .path,  .wall],
            [.wall, .path,  .path,  .path,  .wall,  .wall,  .path,  .path,  .path,  .wall],
            [.wall, .path,  .wall,  .path,  .path,  .path,  .path,  .wall,  .path,  .wall],
            [.wall, .path,  .wall,  .wall,  .wall,  .path,  .wall,  .wall,  .path,  .wall],
            [.wall, .path,  .path,  .path,  .path,  .path,  .path,  .path,  .path,  .wall],
            [.wall, .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .exit,  .wall],
            [.wall, .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall,  .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 8, column: 8),
        timeLimit: 7,
        optimalMoves: 14 // Placeholder: Verify and Update
    ),
    
    // Level 9: The Cross
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .path, .path, .path, .path, .wall, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .path, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .path, .path, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .start, .path, .path, .path, .path, .wall],
            [.wall, .path, .wall, .path, .path, .path, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .wall, .path, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .wall, .path, .path, .exit, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 4, column: 4),
        exitPosition: Player(row: 7, column: 8),
        timeLimit: 6,
        optimalMoves: 7 // Placeholder: Verify and Update
    ),
    
    // Level 10: The Finale
    Maze(
        grid: [
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .start, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .path, .path, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .wall, .wall, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .wall, .exit, .path, .wall, .path, .wall],
            [.wall, .path, .wall, .path, .wall, .wall, .wall, .wall, .path, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 5, column: 5),
        timeLimit: 5,
        optimalMoves: 18 // Placeholder: Verify and Update
    )
]
