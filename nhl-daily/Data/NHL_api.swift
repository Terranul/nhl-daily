//
//  NHL_api.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import Foundation
import SwiftUI
import Combine

class NHL_api: ObservableObject{
    
    @Published var boxScore : BoxScore?  = nil
    @Published var schedule: Schedule? = nil
    
    // handle all calls to the api, returning only json values
    func populateSchedule(url: String) throws {
        
        // turn the string into a valid url to give to URL session]
        guard let url = URL(string: url) else {
            throw NSError()
        }
        URLSession.shared.dataTask(with: url) {data ,_,_ in
            guard let data = data else {
                return
            }
            // continue if no issues
            DispatchQueue.main.async {
                do {
                    self.schedule = try JSONDecoder().decode(Schedule.self, from: data)
                    print(self.schedule!.games.first!.awayTeam.abbrev)
                } catch {
                    print("Decoding error:", error)
                }
            }
        }.resume()
    }
    
    // populates the box score by calling the nhl api with a given game
    func populateGameStats(url: String) throws {
        
        guard let url = URL(string: url) else {
            throw NSError()
        }
        URLSession.shared.dataTask(with: url) {data ,_,_ in
            guard let data = data else {
                return
            }
            // continue if no issues
            DispatchQueue.main.async {
                do {
                    self.boxScore = try JSONDecoder().decode(BoxScore.self, from: data)
                    print(self.boxScore!.playerByGameStats.awayTeam.goalies.first!.name.keys.first!)
                } catch {
                     print("issue creating schedule")
                }
            }
        }.resume()
    }
}
