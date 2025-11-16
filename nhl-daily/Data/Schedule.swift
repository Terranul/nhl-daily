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
    let awayTeam: Team
    let homeTeam: Team
    let clock: ClockTime
    var id: Int
}

struct Team: Decodable {
    let abbrev: String
    let score: Int
    let sog: Int?
    let logo: String?
}

struct ClockTime: Decodable {
    let timeRemaining: String
}
