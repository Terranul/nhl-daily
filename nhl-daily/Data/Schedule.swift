//
//  Schedule.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import Foundation

struct Schedule: Decodable {
    let games: [Game]
}

struct Game: Decodable, Identifiable {
    let startTimeUTC: String
    let gameState: String // LIVE -> ongoing, FUT -> upcoming, OFF -> complete, PRE -> pregame (same fields are FUT)
    let awayTeam: Team
    let homeTeam: Team
    // *** Only available if the game is ongoing or complete
    let clock: ClockTime?
    let period: Int?
    // ***
    var id: Int
}

struct Team: Decodable {
    let abbrev: String
    // a FUT or PRE game will only have:
    let record: String?
    let odds: [Odds]? // these will only be populated the day of by my findings
    // a LIVE or OFF game will have:
    let score: Int?
    let sog: Int?
    let logo: String?
}

struct ClockTime: Decodable {
    let timeRemaining: String
    let inIntermission: Bool
}

struct Odds: Decodable {
    let providerId: Int
    let value: String
}
