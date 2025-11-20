//
//  TeamChange.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-16.
//

import SwiftUI

struct TeamChange: View {
    
    let stats: TeamStandingChange
    
    
    var body: some View {
        HStack {
            if (stats.phase == Phase.DOWN) {
                Text("<")
                    .font(.system(size: 10))
                    .foregroundStyle(.red)
                    .bold()
                    .padding(8)
            } else if (stats.phase == Phase.STATIC) {
                Text("=")
                    .font(.system(size: 10))
                    .foregroundStyle(.orange)
                    .bold()
                    .padding(8)
            } else {
                Text(">")
                    .font(.system(size: 10))
                    .foregroundStyle(.green)
                    .bold()
                    .padding(8)
            }
            Text(stats.change.formatted())
                .font(.system(size: 10))
                .foregroundStyle(.black)
                .bold()
                .padding(8)
        }
    }
}
