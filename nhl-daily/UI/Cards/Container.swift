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
    
    var body: some View {
        VStack {
            if let schedule = api.schedule {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(schedule.games) { curGame in
                            // render each game in a horizontal scroll bar
                            Match(game: curGame)
                                .padding(10)
                        }
                    }
                }
            }
        }
        // cancel the current task when the binding changes
        .task(id: date) {
            do {
                // luckily the api takes in the same format of our date string
                try api.populateSchedule(url: "https://api-web.nhle.com/v1/score/\(date)")
            } catch {
                print("Issue populating the shhedule")
            }
        }
    }
}
