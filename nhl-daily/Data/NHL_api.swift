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
    
    @Published var boxScore : [BoxScore] = []
    @Published var schedule: Schedule? = nil
    @Published var prevStandings: Standing? = nil
    @Published var curStandings: Standing? = nil
    
    // handle all calls to the api, returning only json values
    // populateStats details whether you want to call the api to get the stats of a game
    //  -> only applicable when you have a game in the future
    func populateSchedule(url: String, populateStats: Bool) throws {
        // reset box score becuase we are on a new day
        // othewise this ends up appending onto the previous or next day
        boxScore = []
        
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
                    //print(self.schedule!.games.first!.awayTeam.abbrev)
                    // with the game data, now we can populate the stats
                    if (populateStats) {
                        try self.populateArrayOfGames()
                    }
                } catch {
                    print("Decoding error:", error)
                }
            }
        }.resume()
    }
    
    // populates the box score by calling the nhl api with a given game
    func populateGameStats(url: String, completion: @escaping (BoxScore) -> Void) throws {
        
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
                    // here we give the data back to the iterator
                    completion(try JSONDecoder().decode(BoxScore.self, from: data))
                } catch {
                     print("issue creating schedule: gameStats")
                }
            }
        }.resume()
    }
    
    func populateStandings(url: String, prev: Bool) throws{
        
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
                    // here we give the data back to the iterator
                    if (prev) {
                        self.prevStandings = try JSONDecoder().decode(Standing.self, from: data)
                    } else {
                        self.curStandings = try JSONDecoder().decode(Standing.self, from: data)
                    }
                } catch {
                     print("issue creating schedule: standings")
                }
            }
        }.resume()
    }
    
    // must be called when schedule is non-nil!!
    func populateArrayOfGames() throws{
        for game in schedule!.games {
            try populateGameStats(url: "https://api-web.nhle.com/v1/gamecenter/\(game.id)/boxscore") {score in
                self.boxScore.append(score)
            }
        }
    }
}
