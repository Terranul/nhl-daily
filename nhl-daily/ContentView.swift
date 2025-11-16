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
            Landing()
        }.task {
            do {
                try api.populateSchedule(url: "https://api-web.nhle.com/v1/score/2025-11-14")
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
