//
//  MazeLevels.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import Foundation

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
        timeLimit: 30,
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
        timeLimit: 25,
        optimalMoves: 35 // Placeholder: Verify and Update
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
        timeLimit: 30,
        optimalMoves: 16 // Placeholder: Verify and Update
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
            [.wall, .path, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .path, .path, .path, .path, .path, .path, .path, .path, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
            [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
        ],
        startPosition: Player(row: 1, column: 1),
        exitPosition: Player(row: 5, column: 6),
        timeLimit: 35,
        optimalMoves: 23 // Placeholder: Verify and Update
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
        timeLimit: 25,
        optimalMoves: 16 // Placeholder: Verify and Update
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
        timeLimit: 20,
        optimalMoves: 16 // Placeholder: Verify and Update
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
        timeLimit: 30,
        optimalMoves: 10 // Placeholder: Verify and Update
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
        timeLimit: 30,
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
        timeLimit: 20,
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
        timeLimit: 15,
        optimalMoves: 10 // Placeholder: Verify and Update
    )
]
