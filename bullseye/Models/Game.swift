//
//  Game.swift
//  bullseye
//
//  Created by ira on 03.04.2021.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = [] 
    
    func points(sliderValue: Int) -> Int {
        let diff = abs(self.target - sliderValue)
        let bonus: Int
        if diff == 0 {
            bonus = 100
        } else if diff <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        return 100 - diff + bonus
    }
    
    mutating func startNewRound(points: Int) {
        round += 1
        score += points
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
    
    mutating func addToLeaderboard(points: Int){
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
}
