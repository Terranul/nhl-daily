//
//  MatchFUT.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-21.
//

import SwiftUI

struct MatchFUT: View {
    
    // represents the UI for a match card that will take place in the future
    // the gameType field for this match must be "FUT" becuase we do some sketchy unwrapping here, so please check it before
    // no need to check if the odds are present or not, this will do it for you
    
    let game: Game
    let scheduleManager: ScheduleManager = ScheduleManager()
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                HStack {
                    VStack {
                        Text(game.homeTeam.abbrev)
                            .font(.system(size: 40))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(5)
                        Text(game.homeTeam.record!)
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                            .bold()
                            .padding(5)
                    }
                    .padding(10)
                    if let odds = game.homeTeam.odds {
                        Text(odds[2].value)
                            .font(.system(size: 30))
                            .foregroundStyle(.gray)
                            .bold()
                    }
                }
                .padding(5)
                HStack {
                    VStack {
                        Text(game.awayTeam.abbrev)
                            .font(.system(size: 40))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(5)
                        Text(game.awayTeam.record!)
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                            .bold()
                            .padding(5)
                    }
                    .padding(10)
                    if let odds = game.awayTeam.odds {
                        Text(odds[2].value)
                            .font(.system(size: 30))
                            .foregroundStyle(.gray)
                            .bold()
                    }
                }
                .padding(5)
            }
            // reformats time back to local and in the format HH:MM
            Text(scheduleManager.reformatTime(timeUTC: game.startTimeUTC))
                .foregroundStyle(.black)
                .font(.system(size: 30))
                .padding(10)
        }
        .background(.white)
        .cornerRadius(5)
    }
}
