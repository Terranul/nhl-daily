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
                    Text(game.awayTeam.abbrev)
                        .font(.system(size: 40))
                        .foregroundStyle(.black)
                        .bold()
                        .padding(10)
                    Text(game.awayTeam.score.formatted())
                        .font(.system(size: 40))
                        .foregroundStyle(.gray)
                        .bold()
                }
                HStack {
                    Text(game.homeTeam.abbrev)
                        .font(.system(size: 40))
                        .foregroundStyle(.black)
                        .bold()
                        .padding(5)
                    Text(game.homeTeam.score.formatted())
                        .font(.system(size: 40))
                        .foregroundStyle(.gray)
                        .bold()
                }
            }
            // here we load the time remaining and the period
            // note the game may not be finished becuase we are not conisdering seconds... but who cares
            if (game.clock.timeRemaining == "00:00") {
                Text("Final Score")
                    .foregroundStyle(.black)
                    .font(.system(size: 30))
                    .padding(10)
            } else {
                Text(game.clock.timeRemaining)
                    .foregroundStyle(.green)
                    .font(.system(size: 30))
                    .padding(10)
            }
        }
        .background(.white)
        .cornerRadius(10)
    }
}
