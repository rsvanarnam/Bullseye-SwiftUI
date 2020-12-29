//
//  Game.swift
//  Bullseye SwiftUI
//
//  Created by Rebecca Van Arnam on 12/18/20.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in:1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    // Displays some data for previewing purposes on LeaderboardView.
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 30, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
        }
    }
    
    /* Awards points based on the difference of the goal and the chosen number on the slider.
    If within two points, awards an additional 50 points, if exact, 100 extra points. */
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 51
        } else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    // Adds score and date to leaderboardEntry array.
    mutating func addToLeaderboard(point: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    // Updates score and points. Generates and shows a new random target number. Updates leaderboard.
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(point: points)
    }
    
    // Resets the score and round. Generates new random number for target.
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
