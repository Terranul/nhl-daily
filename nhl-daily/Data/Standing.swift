//
//  Standing.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-16.
//

struct Standing: Decodable {
    let standings: [TeamStanding]
}

struct TeamStanding: Decodable, Hashable {
    let losses: Int
    let otLosses: Int
    let wins: Int
    let gamesPlayed: Int
    let teamAbbrev: [String : String]
    let points: Int
    let leagueSequence: Int // the position in the league
}

struct TeamStandingChange: Hashable {
    let teamStanding: TeamStanding
    let change: Int
    let phase: Phase
}

