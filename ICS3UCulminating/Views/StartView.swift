//
//  StartView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import SwiftUI

struct StartView: View {
    
    // MARK: - Stored properties
    
    // This closure will be called when the user taps "Start Game".
    // It allows the parent view (the App) to switch the screen.
    var onStart: () -> Void
    
    // MARK: - Computed properties
    
    var body: some View {
        ZStack {
            // 1. BACKGROUND: A subtle gradient to make it look modern
            LinearGradient(
                colors: [.black, .gray.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                // 2. ICON: A maze-themed symbol
                Image(systemName: "square.grid.3x3.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.green)
                    .shadow(color: .green.opacity(0.5), radius: 10)
                
                // 3. TITLE SECTION
                VStack(spacing: 10) {
                    Text("MAZE RUNNER")
                        .font(.system(size: 50, weight: .black, design: .monospaced))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    Text("THE PERFECT PATH CHALLENGE")
                        .font(.caption)
                        .kerning(4) // Spaces out the letters for a "cinematic" feel
                        .foregroundColor(.green)
                        .bold()
                }
                
                // 4. INSTRUCTIONS: Brief overview for the player
                VStack(alignment: .leading, spacing: 10) {
                    instructionRow(icon: "timer", text: "Beat the ticking clock.")
                    instructionRow(icon: "figure.walk", text: "Find the exact shortest path.")
                    instructionRow(icon: "keyboard", text: "Use arrow keys to move.")
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(15)
                
                // 5. START BUTTON
                Button(action: onStart) {
                    Text("START GAME")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 250, height: 60)
                        .background(Color.green)
                        .cornerRadius(30)
                        .shadow(color: .green.opacity(0.4), radius: 10, x: 0, y: 5)
                }
                .padding(.top, 20)
                
                Text("Version 1.0")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
    
    // MARK: - Helper Functions
    
    /// A helper to create a consistent row of instructions with an icon.
    func instructionRow(icon: String, text: String) -> some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 30)
            Text(text)
                .foregroundColor(.white)
                .font(.subheadline)
        }
    }
}

#Preview {
    StartView(onStart: {})
}
