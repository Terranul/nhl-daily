//
//  Team.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-16.
//

//struct TeamStanding: Decodable, Hashable {
//    let losses: Int
//    let otLosses: Int
//    let wins: Int
//    let gamesPlayed: Int
//    let teamAbbrev: [String : String]
//    let points: Int
//    let leagueSequence: Int // the position in the league
//}

import SwiftUI

struct TeamView: View {
    
    let teamChg: TeamStandingChange
    let team: TeamStanding
    
    init(teamChg: TeamStandingChange) {
        self.teamChg = teamChg
        self.team = teamChg.teamStanding
    }
    
    var body: some View {
        HStack {
            Text(team.leagueSequence.formatted() + ".")
                .font(.system(size: 15))
                .foregroundStyle(.black)
                .bold()
                .padding(8)
            Text(team.teamAbbrev.values.first!)
                .font(.system(size: 15))
                .foregroundStyle(.black)
                .bold()
                .padding(8)
            Text(team.gamesPlayed.formatted())
                .font(.system(size: 15))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(team.wins.formatted())
                .font(.system(size: 15))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(team.otLosses.formatted())
                .font(.system(size: 15))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(team.losses.formatted())
                .font(.system(size: 15))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(team.points.formatted())
                .font(.system(size: 15))
                .foregroundStyle(.black)
                .bold()
                .padding(8)
        }
        .frame(width: 350, height: 65)
        .background(Color.white)
        .cornerRadius(10)
    }
}
