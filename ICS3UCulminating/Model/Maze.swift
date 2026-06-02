//
//  Maze.swift
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

// MARK: - Player Struct
// This keeps track of where the player is located on the grid.
// 'row' is the vertical position, 'column' is the horizontal position.
struct Player {
    var row: Int
    var column: Int
}

// MARK: - Maze Struct
// This structure holds all the data for a single level.
struct Maze {
    
    // MARK: - Stored properties
    
    // The grid is an "array of arrays". 
    // Think of it like a spreadsheet where each cell contains a TileType.
    let grid: [[TileType]]
    
    // We store these so the game knows where to put the player at the start
    // and when the player has successfully reached the end.
    let startPosition: Player
    let exitPosition: Player
    
    // MARK: - Computed properties
    
    // Returns how many rows are in the maze.
    var rowCount: Int {
        return grid.count
    }
    
    // Returns how many columns are in the maze.
    // It looks at the first row to see how wide the grid is.
    var columnCount: Int {
        if grid.isEmpty {
            return 0
        } else {
            return grid[0].count
        }
    }
}

// MARK: - Example Data
// This is a pre-built maze we can use to test our game logic.
// 0 = Wall, 1 = Path, 2 = Start, 3 = Exit
let exampleMaze = Maze(
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
    exitPosition: Player(row: 8, column: 8)
)
