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
    
    // The list of all available levels loaded from MazeLevels.swift.
    var levels: [Maze]
    
    // The index of the level the player is currently on (0 is Level 1, 1 is Level 2, etc.)
    var currentLevelIndex: Int = 0
    
    // A "helper" property that always returns the maze data for the current level.
    var maze: Maze {
        return levels[currentLevelIndex]
    }
    
    // The current location of the player on the grid.
    var player: Player
    
    // This property tracks whether the player has reached the exit of the LAST level.
    var hasWonGame: Bool = false
    
    // Tracks if the player ran out of time or out of moves.
    var hasLostGame: Bool = false
    
    // How many seconds are left for the current level.
    var timeRemaining: Int = 0
    
    // How many moves the player has made in the current level.
    var movesMade: Int = 0
    
    // A calculated property: subtracting moves made from the level's limit.
    var movesRemaining: Int {
        return maze.optimalMoves - movesMade
    }
    
    // A timer object that runs in the background to handle the countdown.
    private var timer: Timer?
    
    // MARK: - Initializer
    // When we create the ViewModel, we set up Level 1 and start the clock.
    init(levels: [Maze] = mazeLevels) {
        self.levels = levels
        self.player = levels[0].startPosition
        self.timeRemaining = levels[0].timeLimit
        startTimer()
    }
    
    // MARK: - Functions
    
    /// Starts the countdown timer.
    func startTimer() {
        // Stop any existing timer first to prevent multiple timers running at once.
        timer?.invalidate()
        
        // Create a new timer that runs every 1 second.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    /// This function is called every second by the timer.
    private func tick() {
        // If the game is already over (won or lost), we stop the clock.
        if hasWonGame || hasLostGame {
            timer?.invalidate()
            return
        }
        
        // Decrease the time remaining by 1 second.
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
        // If the game is already over, we disable all movement.
        if hasWonGame || hasLostGame { return }
        
        // 1. Calculate the intended new coordinates.
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
        
        // 2. BOUNDS CHECK: Is the move actually on the board?
        let isWithinBounds = newRow >= 0 && newRow < maze.rowCount &&
                             newColumn >= 0 && newColumn < maze.columnCount
        
        if isWithinBounds {
            // 3. COLLISION DETECTION: Is the target tile a wall?
            let targetTile = maze.grid[newRow][newColumn]
            
            if targetTile != .wall {
                // UPDATE POSITION: Move the player.
                player.row = newRow
                player.column = newColumn
                
                // TRACK PROGRESS: Increment the move counter.
                movesMade += 1
                
                // 4. WIN CHECK: Did the player reach the green exit tile?
                if player.row == maze.exitPosition.row && player.column == maze.exitPosition.column {
                    advanceLevel()
                } else if movesRemaining <= 0 {
                    // 5. MOVE LIMIT CHECK: If out of moves and NOT on exit, player loses.
                    hasLostGame = true
                }
            }
        }
    }
    
    /// Logic to handle moving to the next level or winning the whole game.
    private func advanceLevel() {
        if currentLevelIndex < levels.count - 1 {
            // Move to the next level index.
            currentLevelIndex += 1
            
            // Set up the NEW level's starting state.
            player = maze.startPosition
            timeRemaining = maze.timeLimit
            movesMade = 0
            
            // Restart the timer for the fresh level.
            startTimer()
        } else {
            // If there are no more levels, the player wins the entire marathon!
            hasWonGame = true
            timer?.invalidate()
        }
    }
    
    /// Resets the game to Level 1 and clears all win/loss states.
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
