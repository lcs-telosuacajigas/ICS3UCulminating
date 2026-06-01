//
//  Maze.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import Foundation

// MARK: - TileType Enum
enum TileType: Int {
    case wall = 0
    case path = 1
    case start = 2
    case exit = 3
}

// MARK: - Player Struct
struct Player {
    var row: Int
    var column: Int
}

// MARK: - Maze Struct
struct Maze {
    
    // MARK: - Stored properties
    let grid: [[TileType]]
    let startPosition: Player
    let exitPosition: Player
    
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

// MARK: - Example Data
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
