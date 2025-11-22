//
//  Match.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

// builds the visual representation for a match, given the current day

import SwiftUI

struct Match:View {
    
    var game: Game
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                HStack {
                    VStack {
                        Text(game.awayTeam.abbrev)
                            .font(.system(size: 40))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(5)
                        Text("SOG: " + game.awayTeam.sog!.formatted())
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                    }
                    .padding(10)
                    Text(game.awayTeam.score!.formatted())
                        .font(.system(size: 40))
                        .foregroundStyle(.gray)
                        .bold()
                        .padding(5)
                }
                .padding(5)
                HStack {
                    VStack {
                        Text(game.homeTeam.abbrev)
                            .font(.system(size: 40))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(5)
                        Text("SOG: " + game.homeTeam.sog!.formatted())
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                    }
                    .padding(10)
                    Text(game.homeTeam.score!.formatted())
                        .font(.system(size: 40))
                        .foregroundStyle(.gray)
                        .bold()
                        .padding(5)
                }
                .padding(5)
            }
            // here we load the time remaining and the period
            VStack {
                if (game.gameState == "OFF") {
                    Text("Final Score")
                        .foregroundStyle(.black)
                        .font(.system(size: 30))
                        .padding(10)
                } else {
                    Text("Period " + game.period!.formatted())
                        .font(.system(size: 30))
                        .foregroundStyle(.gray)
                    Text(game.clock!.timeRemaining)
                        .foregroundStyle(.green)
                        .font(.system(size: 30))
                        .padding(10)
                }
            }
            .padding(10)
        }
        .background(.white)
        .cornerRadius(10)
    }
}
