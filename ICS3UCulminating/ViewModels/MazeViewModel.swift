//
//  MazeViewModel.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import Foundation
import Observation

// MARK: - Direction Enum
// This enum helps us pass simple directions to our movement function.
enum Direction {
    case up, down, left, right
}

// MARK: - MazeViewModel Class
// The ViewModel is the "brain" of the game. It handles the logic.
// We use the @Observable macro so the View automatically updates when data changes.
@Observable
class MazeViewModel {
    
    // MARK: - Stored properties
    
    // The current layout of the maze.
    var maze: Maze
    
    // The current location of the player on the grid.
    var player: Player
    
    // This property tracks whether the player has reached the exit.
    var hasWon: Bool = false
    
    // MARK: - Initializer
    // When we create the ViewModel, we start with the example maze
    // and put the player at the maze's designated start position.
    init(maze: Maze = exampleMaze) {
        self.maze = maze
        self.player = maze.startPosition
    }
    
    // MARK: - Functions
    
    /// Attempts to move the player in a given direction.
    /// - Parameter direction: The direction (up, down, left, or right) the player wants to go.
    func move(_ direction: Direction) {
        // If the player has already won, we don't let them move anymore.
        if hasWon { return }
        
        // 1. Calculate where the player *wants* to go based on their current position.
        var newRow = player.row
        var newColumn = player.column
        
        switch direction {
        case .up:
            newRow -= 1
        case .down:
            newRow += 1
        case .left:
            newColumn -= 1
        case .right:
            newColumn += 1
        }
        
        // 2. SAFETY CHECK: Is the new position actually inside the maze grid?
        // We check if the new row/column is within the boundaries (0 to rowCount/columnCount).
        let isWithinBounds = newRow >= 0 && newRow < maze.rowCount &&
                             newColumn >= 0 && newColumn < maze.columnCount
        
        if isWithinBounds {
            // 3. COLLISION DETECTION: Is the tile at the new position a wall?
            let targetTile = maze.grid[newRow][newColumn]
            
            if targetTile != .wall {
                // If it's NOT a wall, update the player's position.
                // Because this class is @Observable, the View will see this and move the icon.
                player.row = newRow
                player.column = newColumn
                
                // 4. WIN CHECK: Did the player just step on the exit?
                if player.row == maze.exitPosition.row && player.column == maze.exitPosition.column {
                    hasWon = true
                }
            }
        }
    }
    
    /// Resets the game to the starting state.
    func resetGame() {
        player = maze.startPosition
        hasWon = false
    }
}
