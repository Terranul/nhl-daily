//
//  ContainerFUT.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-21.
//

import SwiftUI

struct ContainerFUT: View {
    
    @StateObject var api: NHL_api = NHL_api()
    @Binding var date: String
    @Binding var prevDate: String
    let statsManager: StatsManager = StatsManager()
    let scheduleManager: ScheduleManager = ScheduleManager()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if let schedule = api.schedule {
                    ForEach(schedule.games) { game in
                        MatchFUT(game: game)
                            .padding(10)
                    }
                }
            }
        }
        .task(id: date) {
            do {
                // luckily the api takes in the same format of our date string
                try api.populateSchedule(url: "https://api-web.nhle.com/v1/score/\(date)", populateStats: false)
            } catch {
                print("Issue populating the shhedule")
            }
        }
    }
}
