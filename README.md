# Maze Runner Game

## Overview
Maze Runner is a logic-based game where the player navigates a character through a 2D grid of tiles. The goal is to move from a **Starting Point** to an **Exit Point** while avoiding **Walls**.

## How it Works (MVVM Architecture)

### 1. The Model (Data)
The game's "DNA" is defined in `Maze.swift`.
- **The Grid**: A 2D list (rows and columns) where each spot is either a wall, a path, a start, or an exit.
- **The Player**: A simple marker that knows its current `row` and `column` coordinates.

### 2. The ViewModel (Logic)
The "brain" that manages the game state (to be implemented in `MazeViewModel.swift`).
- It holds the current position of the player.
- It contains the rules for movement: "If the player wants to move Right, check if the tile to the right is a Wall. If it isn't, change the player's position."
- It checks for the win condition: "Does the player's row and column match the exit's row and column?"

### 3. The View (Interface)
What the user sees (to be implemented in `MazeView.swift`).
- It draws a square for every tile in the grid.
- It places an icon (the player) at the current coordinates.
- It provides buttons or gestures to send movement commands to the ViewModel.

---

## Example Game Session (Step-by-Step)

Imagine a small 3x3 maze:
```
[W] [W] [W]
[S] [P] [W]
[W] [E] [W]
```
*(W = Wall, S = Start, P = Path, E = Exit)*

1.  **Start**: The game begins. The ViewModel sets the **Player Position** to Row 1, Column 0 (the `[S]` tile).
2.  **Move Right**: The user taps the "Right" button.
    - The ViewModel checks Row 1, Column 1. It is a **Path `[P]`**.
    - The move is valid! The Player Position is updated to Row 1, Column 1.
    - The View automatically refreshes to show the player icon in the middle.
3.  **Invalid Move**: The user taps "Up".
    - The ViewModel checks Row 0, Column 1. It is a **Wall `[W]`**.
    - The move is rejected. The player stays at Row 1, Column 1.
4.  **Move Down**: The user taps "Down".
    - The ViewModel checks Row 2, Column 1. It is the **Exit `[E]`**.
    - The move is valid! The Player Position is updated.
5.  **Win**: The ViewModel detects the player is now on the Exit tile. It sets a `gameWon` property to `true`, which triggers a "You Win!" message on the screen.
