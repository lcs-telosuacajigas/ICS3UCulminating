//
//  ModeSelectionView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-01.
//

import SwiftUI

struct ModeSelectionView: View {
    
    // MARK: - Stored properties
    
    // This closure tells the parent view which mode was selected.
    var onModeSelected: (GameMode) -> Void
    
    // This closure tells the parent view to go back.
    var onBack: () -> Void
    
    // MARK: - Computed properties
    
    var body: some View {
        ZStack {
            // Background to match the StartView
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                // BACK BUTTON
                HStack {
                    Button(action: onBack) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                        .padding()
                    }
                    Spacer()
                }
                
                Text("CHOOSE YOUR CHALLENGE")
                    .font(.title2)
                    .bold()
                    .kerning(2)
                    .foregroundColor(.white)
                
                // 1. MARATHON MODE BUTTON
                Button(action: { onModeSelected(.marathon) }) {
                    modeButtonContent(
                        title: "MARATHON",
                        subtitle: "10 Levels of handcrafted puzzles.",
                        icon: "flag.checkered",
                        color: .blue
                    )
                }
                
                // 2. ENDLESS MODE BUTTON
                Button(action: { onModeSelected(.endless) }) {
                    modeButtonContent(
                        title: "ENDLESS BLITZ",
                        subtitle: "Procedural levels. 6s limit. How far can you go?",
                        icon: "infinity",
                        color: .orange
                    )
                }
                
                Spacer()
            }
            .padding(30)
        }
    }
    
    // MARK: - Helper Functions
    
    /// Creates a styled box for each game mode.
    func modeButtonContent(title: String, subtitle: String, icon: String, color: Color) -> some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(color)
                .frame(width: 60)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(color.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview {
    ModeSelectionView(onModeSelected: { _ in }, onBack: { })
}
