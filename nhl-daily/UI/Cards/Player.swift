//
//  Player.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

// represents the statiscal creation of a player (show name, assists, goals and points)

import SwiftUI

struct Skater:View {
    
    let player: PlayerStats
    
    var body: some View {
        HStack {
            Text(player.name.values.first!)
                .font(.system(size: 25))
                .foregroundStyle(.black)
                .bold()
                .padding(8)
            Text(player.goals.formatted())
                .font(.system(size: 25))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(player.assists.formatted())
                .font(.system(size: 25))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(player.points.formatted())
                .font(.system(size: 25))
                .foregroundStyle(.black)
                .bold()
                .padding(8)
        }
        .frame(width: 350, height: 65)
        .background(Color.white)
        .cornerRadius(10)
    }
}
