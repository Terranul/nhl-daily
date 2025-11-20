//
//  StandPreview.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-19.
//

import SwiftUI

struct StandPreview: View {
    
    // the standings card on the main page (also holds a button to the full standings)
    
    var date: String
    var prevDate: String
    let schedule: Schedule
    @StateObject var api: NHL_api = NHL_api()
    let standingsManager: StandingsManager = StandingsManager()
    
    var body: some View {
        VStack {
            if let prevStandings = api.prevStandings {
                if let curStandings = api.curStandings {
                    let standingsChange = standingsManager.returnChanges(curr: curStandings, dayBefore: prevStandings, schedule: schedule)
                    let topChanges = standingsManager.returnTopChanges(teams: standingsChange, amount: 5)
                    HStack {
                        Text("Biggest Climbers Today")
                            .foregroundStyle(.white)
                            .padding(5)
                            .bold()
                            .font(.system(size: 20))
                        Spacer()
                        NavigationLink {
                            Standings(standings: standingsChange, date: date)
                        } label: {
                            Text("See Full Standings")
                                .foregroundStyle(.white)
                        }
                    }
                    ForEach(topChanges, id: \.self) { standing in
                        TeamPreview(teamStanding: standing)
                    }
                }
            }
        }
        .task(id: date) {
            do {
                try api.populateStandings(url: "https://api-web.nhle.com/v1/standings/\(date)" , prev: false)
                try api.populateStandings(url: "https://api-web.nhle.com/v1/standings/\(prevDate)" , prev: true)
                print("population complete")
            } catch {
                print("Issue populating standings")
            }
        }
    }
}
