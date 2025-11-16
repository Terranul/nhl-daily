//
//  Standings.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-16.
//

import SwiftUI

struct Standings: View {
    
    let date: String
    let prevDate: String
    let schedule: Schedule
    @StateObject var api: NHL_api = NHL_api()
    let standingsManager: StandingsManager = StandingsManager()
    
    var body: some View {
        VStack {
            if let curStandings = api.curStandings {
                if let prevStandings = api.prevStandings {
                    ForEach(standingsManager.returnChanges(curr: curStandings, dayBefore: prevStandings, schedule: schedule), id: \.self) {dict in
                        TeamView(teamChg: dict)
                            .padding(10)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .task {
            do {
                try api.populateStandings(url: "https://api-web.nhle.com/v1/standings/\(date)" , prev: false)
                try api.populateStandings(url: "https://api-web.nhle.com/v1/standings/\(prevDate)" , prev: true)
            } catch {
                print("Issue populating standings")
            }
        }
        .background(.white)
        .cornerRadius(10)
    }
}
