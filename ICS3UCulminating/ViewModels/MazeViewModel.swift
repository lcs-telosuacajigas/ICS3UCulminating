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
    
    // The list of all available levels.
    var levels: [Maze]
    
    // The index of the level the player is currently on (0, 1, 2, etc.)
    var currentLevelIndex: Int = 0
    
    // The current layout of the maze.
    var maze: Maze {
        return levels[currentLevelIndex]
    }
    
    // The current location of the player on the grid.
    var player: Player
    
    // This property tracks whether the player has reached the exit of the LAST level.
    var hasWonGame: Bool = false
    
    // Tracks if the player ran out of time.
    var hasLostGame: Bool = false
    
    // How many seconds are left for the current level.
    var timeRemaining: Int = 0
    
    // How many moves the player has made in the current level.
    var movesMade: Int = 0
    
    // How many moves are remaining for the perfect path.
    var movesRemaining: Int {
        return maze.optimalMoves - movesMade
    }
    
    // A timer object that runs in the background.
    private var timer: Timer?
    
    // MARK: - Initializer
    // When we create the ViewModel, we start with the first level
    // and put the player at that maze's designated start position.
    init(levels: [Maze] = mazeLevels) {
        self.levels = levels
        self.player = levels[0].startPosition
        self.timeRemaining = levels[0].timeLimit
        startTimer()
    }
    
    // MARK: - Functions
    
    /// Starts the countdown timer.
    func startTimer() {
        // Stop any existing timer first.
        timer?.invalidate()
        
        // Create a new timer that runs every 1 second.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    /// This function is called every second by the timer.
    private func tick() {
        // If the game is already over (won or lost), stop the timer.
        if hasWonGame || hasLostGame {
            timer?.invalidate()
            return
        }
        
        // Decrease the time remaining.
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            // If time hits 0, the player loses!
            hasLostGame = true
            timer?.invalidate()
        }
    }
    
    /// Attempts to move the player in a given direction.
    /// - Parameter direction: The direction (up, down, left, or right) the player wants to go.
    func move(_ direction: Direction) {
        // If the game is won or lost, stop movement.
        if hasWonGame || hasLostGame { return }
        
        // 1. Calculate where the player *wants* to go.
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
        
        // 2. SAFETY CHECK: Is it inside the grid?
        let isWithinBounds = newRow >= 0 && newRow < maze.rowCount &&
                             newColumn >= 0 && newColumn < maze.columnCount
        
        if isWithinBounds {
            // 3. COLLISION DETECTION: Is it a wall?
            let targetTile = maze.grid[newRow][newColumn]
            
            if targetTile != .wall {
                // UPDATE POSITION
                player.row = newRow
                player.column = newColumn
                
                // ADD TO MOVE COUNT
                movesMade += 1
                
                // 4. WIN CHECK: Did the player reach the exit?
                if player.row == maze.exitPosition.row && player.column == maze.exitPosition.column {
                    advanceLevel()
                } else if movesRemaining <= 0 {
                    // 5. MOVE LIMIT CHECK: If they haven't reached the exit and are out of moves, they lose!
                    hasLostGame = true
                }
            }
        }
    }
    
    /// Logic to handle moving to the next level or winning the whole game.
    private func advanceLevel() {
        if currentLevelIndex < levels.count - 1 {
            // Move to the next level index
            currentLevelIndex += 1
            // Put the player at the start of the NEW level
            player = maze.startPosition
            // Reset the timer and moves for the new level
            timeRemaining = maze.timeLimit
            movesMade = 0
            startTimer()
        } else {
            // If there are no more levels, the player has won the game!
            hasWonGame = true
            timer?.invalidate()
        }
    }
    
    /// Resets the game to the very first level.
    func resetGame() {
        currentLevelIndex = 0
        player = maze.startPosition
        timeRemaining = maze.timeLimit
        movesMade = 0
        hasWonGame = false
        hasLostGame = false
        startTimer()
    }
}
