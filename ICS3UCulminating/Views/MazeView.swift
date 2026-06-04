//
//  MazeView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import SwiftUI

struct MazeView: View {
    
    // MARK: - Stored properties
    
    // This connects our View to the logic (ViewModel).
    // @State ensures that the view refreshes when the ViewModel changes.
    @State private var viewModel = MazeViewModel()
    
    // The size of each square in our maze grid.
    let tileSize: CGFloat = 30
    
    // MARK: - Computed properties
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Title and Level Counter
            VStack {
                Text("Maze Runner")
                    .font(.largeTitle)
                    .bold()
                
                Text("Level \(viewModel.currentLevelIndex + 1) of \(viewModel.levels.count)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                // Timer and Move Display
                HStack(spacing: 30) {
                    Text("Time: \(viewModel.timeRemaining)s")
                        .foregroundColor(viewModel.timeRemaining < 5 ? .red : .primary)
                    
                    Text("Moves: \(viewModel.movesRemaining)")
                        .foregroundColor(viewModel.movesRemaining < 3 ? .red : .primary)
                }
                .font(.title3)
                .bold()
            }
            
            if viewModel.hasWonGame {
                Text("🏆 YOU BEAT THE GAME! 🏆")
                    .font(.title)
                    .foregroundColor(.green)
                    .bold()
            }
            
            if viewModel.hasLostGame {
                let lostReason = viewModel.timeRemaining <= 0 ? "OUT OF TIME" : "OUT OF MOVES"
                Text("⌛️ GAME OVER: \(lostReason) ⌛️")
                    .font(.title)
                    .foregroundColor(.red)
                    .bold()
            }
            
            // 1. THE MAZE GRID
            // We use a ZStack so we can layer the player on top of the grid.
            ZStack(alignment: .topLeading) {
                
                // Draw the static maze (walls and paths)
                VStack(spacing: 0) {
                    // Loop through each row
                    ForEach(0..<viewModel.maze.rowCount, id: \.self) { rowIndex in
                        HStack(spacing: 0) {
                            // Loop through each column in that row
                            ForEach(0..<viewModel.maze.columnCount, id: \.self) { columnIndex in
                                let tile = viewModel.maze.grid[rowIndex][columnIndex]
                                
                                // Color the tile based on what it is
                                rectangle(for: tile)
                                    .frame(width: tileSize, height: tileSize)
                            }
                        }
                    }
                }
                
                // 2. THE PLAYER ICON
                // We calculate the player's position based on their row and column.
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: tileSize * 0.8, height: tileSize * 0.8)
                    .foregroundColor(.blue)
                    // Offset moves the icon from the top-left (0,0) to the correct spot.
                    .offset(
                        x: CGFloat(viewModel.player.column) * tileSize + (tileSize * 0.1),
                        y: CGFloat(viewModel.player.row) * tileSize + (tileSize * 0.1)
                    )
                    // Animation makes the movement look smooth
                    .animation(.easeInOut(duration: 0.1), value: viewModel.player.row)
                    .animation(.easeInOut(duration: 0.1), value: viewModel.player.column)
            }
            .padding()
            .border(Color.gray, width: 2)
            
            // 3. CONTROLS
            // These buttons move the character.
            // I've added .keyboardShortcut so you can also use your arrow keys!
            VStack(spacing: 10) {
                Button(action: { viewModel.move(.up) }) {
                    Image(systemName: "arrow.up.square.fill")
                        .font(.system(size: 50))
                }
                .keyboardShortcut(.upArrow, modifiers: []) // Link to Up Arrow key
                
                HStack(spacing: 40) {
                    Button(action: { viewModel.move(.left) }) {
                        Image(systemName: "arrow.left.square.fill")
                            .font(.system(size: 50))
                    }
                    .keyboardShortcut(.leftArrow, modifiers: []) // Link to Left Arrow key
                    
                    Button(action: { viewModel.move(.right) }) {
                        Image(systemName: "arrow.right.square.fill")
                            .font(.system(size: 50))
                    }
                    .keyboardShortcut(.rightArrow, modifiers: []) // Link to Right Arrow key
                }
                
                Button(action: { viewModel.move(.down) }) {
                    Image(systemName: "arrow.down.square.fill")
                        .font(.system(size: 50))
                }
                .keyboardShortcut(.downArrow, modifiers: []) // Link to Down Arrow key
            }
            
            // Reset Button
            Button("Reset Game") {
                viewModel.resetGame()
            }
            .padding(.top)
        }
        .padding()
    }
    
    // MARK: - Helper Functions
    
    /// Returns a colored rectangle based on the tile type.
    func rectangle(for tile: TileType) -> some View {
        switch tile {
        case .wall:
            return Color.black
        case .path:
            return Color.white
        case .start:
            return Color.gray.opacity(0.3)
        case .exit:
            return Color.green
        }
    }
}

#Preview {
    MazeView()
}
