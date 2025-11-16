//
//  ContentView.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var api: NHL_api = NHL_api()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello!")
        }.task {
            do {
                try api.populateSchedule(url: "https://api-web.nhle.com/v1/score/2025-11-14")
                try api.populateGameStats(url: "https://api-web.nhle.com/v1/gamecenter/2025020279/boxscore")
            } catch {
                print("issue")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
