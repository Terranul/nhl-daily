//
//  ScheduleManager.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-21.
//

import Foundation

struct ScheduleManager {
    // describes operations relevant to the schedule and game display
    
    
    func sortByTimeRemaining(games: [Game]) -> [Game] {
        return games.sorted { game1, game2 in
            if (game1.gameState == "FUT") {
                return false
            } else if (game2.gameState == "FUT") {
                return true
            }
            if let clock1 = game1.clock {
                if let clock2 = game2.clock {
                    return compareTimes(time1: clock1.timeRemaining, time2: clock2.timeRemaining)
                }
                return true
            }
            return false
        }
    }

    // requires that both time1 and time two consist of only numbers and the : symbol
    func compareTimes(time1: String, time2: String) -> Bool{
        if (time1.count > time2.count) {
            return true
        } else if (time1.count < time2.count) {
            return false
        }
        
        let chars1 = Array(time1)
        let chars2 = Array(time2)
        
        for index in 0..<max(chars1.count, chars2.count) {
            let char1 = chars1[index]
            let char2 = chars2[index]
            
            if (char1 != ":" && char2 != ":") {
                if (returnInt(char: char1) > returnInt(char: char2)) {
                    return true
                } else if (returnInt(char: char1) < returnInt(char: char2)) {
                    return false
                }
            }
        }
        return true
    }
    
    private func returnInt(char: Character) -> Int {
        switch(char) {
        case "1":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        case "6":
            return 6
        case "7":
            return 7
        case "8":
            return 8
        case "9":
            return 9
        default:
            return 0
        }
    }
    
    // must be an iso8601 date
    func reformatTime(timeUTC: String) -> String {
        let iso86: ISO8601DateFormatter = ISO8601DateFormatter()
        let currDate: Date = iso86.date(from: timeUTC)!
        let localFormatter = DateFormatter()
        localFormatter.timeZone = .current
        localFormatter.dateStyle = .none
        localFormatter.timeStyle = .short
        return localFormatter.string(from: currDate)
    }
    
    
}
