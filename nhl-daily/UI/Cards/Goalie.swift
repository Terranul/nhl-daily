//
//  Goalie.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-16.
//

import SwiftUI

struct Goalie: View {
    
    let goalie: GoalieStats
    
    var body: some View {
        HStack {
            Text(goalie.name.values.first!)
                .font(.system(size: 25))
                .foregroundStyle(.black)
                .bold()
                .padding(8)
            Text(goalie.saves.formatted())
                .font(.system(size: 25))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(goalie.goalsAgainst.formatted())
                .font(.system(size: 25))
                .foregroundStyle(.gray)
                .bold()
                .padding(8)
            Text(goalie.starter ? (Double(goalie.saves) / Double(goalie.goalsAgainst + goalie.saves)).formatted(.number.precision(.fractionLength(0...3))) : "0")
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
