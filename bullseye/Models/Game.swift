//
//  Game.swift
//  bullseye
//
//  Created by ira on 03.04.2021.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
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
    }
    
    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}
