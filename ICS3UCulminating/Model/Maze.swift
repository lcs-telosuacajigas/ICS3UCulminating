//
//  Maze.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import Foundation

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
    
    // How many seconds the player has to complete this specific level.
    let timeLimit: Int
    
    // The exact number of moves required to reach the exit.
    // NOTE: Update these values manually after testing the levels!
    let optimalMoves: Int
    
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
