//
//  Games.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-21.
//

struct Games {
    let currentDate: String
    let games: [GameInfo]
}

struct GameInfo {
    let startTimeUTC: String
    let gameState: String // FUT -> upcoming, OFF -> game finished
    
}

struct TeamInfo {
    let abbrev: String
    let record: String?
    let odds: [Odds]?
    let score: Int?
    let sog: Int?
}
