//
//  TeamPreview.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-19.
//

import SwiftUI

struct TeamPreview: View {
    
    let teamStanding: TeamStandingChange
    
    var body: some View {
        HStack {
            Text(teamStanding.teamStanding.teamAbbrev.values.first!)
                .font(.system(size: 20))
                .foregroundStyle(.black)
                .padding(5)
            Spacer()
            VStack {
                Text(teamStanding.teamStanding.gamesPlayed.formatted())
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                    .bold()
                    .padding(5)
                Text("GP")
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                    .bold()
                    .padding(5)
            }
            .padding(5)
            Spacer()
            VStack {
                Text(teamStanding.teamStanding.points.formatted())
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                    .bold()
                    .padding(5)
                Text("Points")
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                    .bold()
                    .padding(5)
            }
            .padding(5)
            Spacer()
            VStack {
                Text(teamStanding.change.formatted())
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                    .bold()
                    .padding(5)
                if (teamStanding.phase == Phase.DOWN) {
                    Image(.downArrow)
                } else if (teamStanding.phase == Phase.UP) {
                    Image(.upArrow)
                } else if (teamStanding.phase == Phase.STATIC) {
                    Image(.staticArrow)
                }
            }
        }
        .padding(10)
        .background(.white)
    }
}
