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
    // It is passed in from the App level so it knows which mode was picked.
    @State var viewModel: MazeViewModel
    
    // This closure tells the parent view to go back.
    var onBack: () -> Void
    
    // The size of each square in our maze grid.
    let tileSize: CGFloat = 30
    
    // MARK: - Computed properties
    
    var body: some View {
        VStack(spacing: 20) {
            
            // 0. TOP NAVIGATION BAR
            HStack {
                Button(action: onBack) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Exit Game")
                    }
                    .foregroundColor(.red)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // 1. HEADER SECTION: Title and Stats
            VStack(spacing: 5) {
                Text("Maze Runner")
                    .font(.largeTitle)
                    .bold()
                
                if viewModel.gameMode == .marathon {
                    Text("Level \(viewModel.currentLevelIndex + 1) of \(viewModel.levels.count)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else {
                    Text("Mazes Cleared: \(viewModel.mazesCleared)")
                        .font(.headline)
                        .foregroundColor(.orange)
                }
                
                // Live Stats Display (Time and Moves)
                HStack(spacing: 30) {
                    Text("Time: \(viewModel.timeRemaining)s")
                        .foregroundColor(viewModel.timeRemaining < 3 ? .red : .primary)
                    
                    if viewModel.gameMode == .marathon {
                        Text("Moves: \(viewModel.movesRemaining)")
                            .foregroundColor(viewModel.movesRemaining < 3 ? .red : .primary)
                    }
                }
                .font(.title3)
                .bold()
            }
            
            // 2. GAME STATUS MESSAGES
            // These only appear when the game is won or lost.
            if viewModel.hasWonGame {
                Text("🏆 YOU BEAT THE GAME! 🏆")
                    .font(.title)
                    .foregroundColor(.green)
                    .bold()
            }
            
            if viewModel.hasLostGame {
                // Determine the cause of loss for the message
                let lostReason = viewModel.timeRemaining <= 0 ? "OUT OF TIME" : "OUT OF MOVES"
                let finalScore = viewModel.gameMode == .endless ? "\nScore: \(viewModel.mazesCleared)" : ""
                
                Text("⌛️ GAME OVER: \(lostReason)\(finalScore) ⌛️")
                    .font(.title)
                    .foregroundColor(.red)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            
            // 3. THE MAZE GRID
            // We use a ZStack so we can layer the player on top of the grid.
            ZStack(alignment: .topLeading) {
                
                // LAYER 1: The static maze (walls and paths)
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.maze.rowCount, id: \.self) { rowIndex in
                        HStack(spacing: 0) {
                            ForEach(0..<viewModel.maze.columnCount, id: \.self) { columnIndex in
                                let tile = viewModel.maze.grid[rowIndex][columnIndex]
                                rectangle(for: tile)
                                    .frame(width: tileSize, height: tileSize)
                            }
                        }
                    }
                }
                
                // LAYER 2: The Player Icon
                // This image "floats" over the grid and moves when row/column updates.
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: tileSize * 0.8, height: tileSize * 0.8)
                    .foregroundColor(.blue)
                    .offset(
                        x: CGFloat(viewModel.player.column) * tileSize + (tileSize * 0.1),
                        y: CGFloat(viewModel.player.row) * tileSize + (tileSize * 0.1)
                    )
                    // Animation makes the movement look like sliding instead of jumping.
                    .animation(.easeInOut(duration: 0.1), value: viewModel.player.row)
                    .animation(.easeInOut(duration: 0.1), value: viewModel.player.column)
            }
            .padding()
            .border(Color.gray, width: 2)
            
            // 4. CONTROLS SECTION
            // Directional buttons for mouse users + Keyboard shortcuts for keyboard users.
            VStack(spacing: 10) {
                Button(action: { viewModel.move(.up) }) {
                    Image(systemName: "arrow.up.square.fill")
                        .font(.system(size: 50))
                }
                .keyboardShortcut(.upArrow, modifiers: [])
                
                HStack(spacing: 40) {
                    Button(action: { viewModel.move(.left) }) {
                        Image(systemName: "arrow.left.square.fill")
                            .font(.system(size: 50))
                    }
                    .keyboardShortcut(.leftArrow, modifiers: [])
                    
                    Button(action: { viewModel.move(.right) }) {
                        Image(systemName: "arrow.right.square.fill")
                            .font(.system(size: 50))
                    }
                    .keyboardShortcut(.rightArrow, modifiers: [])
                }
                
                Button(action: { viewModel.move(.down) }) {
                    Image(systemName: "arrow.down.square.fill")
                        .font(.system(size: 50))
                }
                .keyboardShortcut(.downArrow, modifiers: [])
            }
            
            // 5. FOOTER SECTION: Reset Button
            Button("Reset Game") {
                viewModel.resetGame()
            }
            .padding(.top)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    // MARK: - Helper Functions
    
    /// Returns a specific color based on what the maze tile represents.
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
    MazeView(viewModel: MazeViewModel(mode: .marathon), onBack: { })
}
