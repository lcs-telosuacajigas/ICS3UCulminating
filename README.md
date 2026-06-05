# Maze Runner Game

## Overview
Maze Runner is a high-stakes logic puzzle where the player navigates a character through a series of 10 increasingly difficult mazes. The challenge is twofold: you must beat the clock and find the **Perfect Path**.

## Core Game Mechanics

### 1. The Timer (Speed Challenge)
Each level has a specific time limit. If the clock hits zero before you reach the exit, it's Game Over. The timer turns red when you are in "danger time" (less than 5 seconds remaining).

### 2. Perfect Path (Move Limit Challenge)
This is the ultimate test of your planning. Every level has an `optimalMoves` count. This number represents the **exact** minimum moves needed to reach the exit. 
- If you take a wrong turn, you've used a move.
- If you move back to correct yourself, you've used another move.
- Because the limit is exact, any mistake means you will run out of moves before reaching the goal!

### 3. Progressive Difficulty
The game features 10 levels with unique layouts, including spirals, zig-zags, and the "Diamond Chamber." As you progress, the paths get longer and the time limits get tighter.

## Architecture (MVVM)

- **Model**: `TileType.swift`, `Player.swift`, and `Maze.swift` define the data. `MazeLevels.swift` contains the level designs.
- **ViewModel**: `MazeViewModel.swift` acts as the referee. It handles the timer "tick," tracks the move count, detects collisions with walls, and determines if you've won or lost.
- **View**: `MazeView.swift` renders the grid and the player. it captures both on-screen button taps and physical **keyboard arrow key** presses.

---

## Example "Perfect Path" Session

Imagine a level with an `optimalMoves` of 3:
```
[S] [P] [P] [E]
```
1. **Move 1**: Move Right to `[P]`. (Moves Left: 2)
2. **Move 2**: Move Right to `[P]`. (Moves Left: 1)
3. **Move 3**: Move Right to `[E]`. (Moves Left: 0)
4. **Result**: You are on the Exit and have 0 moves left. **You Win!**

*If you had moved Left at step 2, you would have 1 move left but be 3 squares away from the exit, making the level impossible to finish.*
