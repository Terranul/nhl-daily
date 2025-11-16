//
//  BoxScore.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//


// either extending codable and decodable is fine (codable is decodable + encodable

struct BoxScore: Codable {
    let playerByGameStats: BoxScoreTeams
}

struct BoxScoreTeams: Codable {
    let awayTeam: TeamStats
    let homeTeam: TeamStats
}

struct TeamStats: Codable {
    let forwards: [PlayerStats]
    let defense: [PlayerStats]
    let goalies: [GoalieStats]
}

struct PlayerStats: Codable, Hashable {
    let name: [String : String]
    let goals: Int
    let assists: Int
    let points: Int
    let plusMinus: Int
    let playerId: Int
}

struct GoalieStats: Codable, Hashable {
    let name: [String : String]
    let saves: Int
    let starter: Bool
    let goalsAgainst: Int
}

