//
//  Standings.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-16.
//

import SwiftUI

struct Standings: View {
    
    let standings: [TeamStandingChange]
    let date: String
    
    var body: some View {
        VStack {
            Text(date)
                .bold()
                .font(.system(size: 30))
                .foregroundStyle(.white)
                .padding(10)
            Text("Team       GP     W    OTL     L    PTS")
            ScrollView {
                ForEach(standings, id: \.self) { standing in
                    TeamView(teamChg: standing)
                        .padding(10)
                }
            }
            .background(.white)
        }
        .cornerRadius(10)
        .padding(5)
    }
}
