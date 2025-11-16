//
//  Schedule.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

struct Schedule: Decodable {
    let games: [Game]
}

struct GameWeek: Decodable {
    let games: [Game]
}

struct Game: Decodable {
    let startTimeUTC: String
    let awayTeam: Team
    let homeTeam: Team
}

struct Team: Decodable {
    let abbrev: String
    let score: Int
    let sog: Int?
    let logo: String?
}
