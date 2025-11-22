//
//  Container.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import SwiftUI

struct Container: View {
    
    @StateObject var api: NHL_api = NHL_api()
    @Binding var date: String
    @Binding var prevDate: String
    let statsManager: StatsManager = StatsManager()
    let scheduleManager: ScheduleManager = ScheduleManager()
    @State private var selection = 0
    
    var body: some View {
        ScrollView {
            VStack {
                if let schedule = api.schedule {
                    ScrollView(.horizontal) {
                        HStack {
                            let games = scheduleManager.sortByTimeRemaining(games: schedule.games)
                            ForEach(games) { curGame in
                                // render each game in a horizontal scroll bar
                                if (curGame.gameState == "FUT") {
                                    MatchFUT(game: curGame)
                                        .padding(10)
                                } else {
                                    Match(game: curGame)
                                        .padding(10)
                                }
                            }
                        }
                    }
                    StandPreview(date: date, prevDate: prevDate, schedule: schedule)
                }
                // the state object will fire multiple times while it populates boxScore, but it is what it is
                // too lazy to make it better
                if (!(api.boxScore.isEmpty)) {
                    Picker("Options", selection: $selection) {
                        Text("Skaters").tag(0)
                        Text("Goalies").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(10)
                    
                    if (selection == 0) {
                        Text("Player        Goals        Assists        Points")
                        ForEach(statsManager.findDailyLeaders(games: api.boxScore, max: 10), id: \.self) {player in
                            Skater(player: player)
                                .padding(10)
                        }
                    } else {
                        // push the goalies to the View
                        Text("Player        Saves           GA         SV%")
                        ForEach(statsManager.findGoalieLeaders(games: api.boxScore, max: 10), id: \.self) { goalie in
                            Goalie(goalie: goalie)
                                .padding(10)
                        }
                        
                    }
                }
            }
            // cancel the current task when the binding changes
            .task(id: date) {
                do {
                    // luckily the api takes in the same format of our date string
                    try api.populateSchedule(url: "https://api-web.nhle.com/v1/score/\(date)", populateStats: true)
                } catch {
                    print("Issue populating the shhedule")
                }
            }
        }
    }
}
