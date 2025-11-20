//
//  StandingsManager.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-16.
//

enum Phase {
    case UP // increase in standing
    case DOWN // decrease in standing
    case STATIC // no change in standing
    case ONGO // game is ongoing (potential increase in standing)
}

class StandingsManager {
    
    func returnChanges(curr: Standing, dayBefore: Standing, schedule: Schedule) -> [TeamStandingChange] {
        var returnDict : [String: [Phase : Int]] = [:]
        
        for teamStanding in curr.standings {
            returnDict[teamStanding.teamAbbrev["default"]!] = [Phase.UP : teamStanding.leagueSequence]
        }
        // now we know every team has an entry (and that both days will include the same number of teams)
        for teamStanding in dayBefore.standings {
            let entry = returnDict[teamStanding.teamAbbrev["default"]!]
            
            if let entry = entry {
                // calculate difference and change the phase if necessary
                let diff = entry.values.first! - teamStanding.leagueSequence
                if (diff < 0) {
                    returnDict[teamStanding.teamAbbrev["default"]!] = [Phase.UP : abs(diff)]
                } else if (diff == 0) {
                    returnDict[teamStanding.teamAbbrev["default"]!] = [Phase.STATIC : 0]
                } else {
                    returnDict[teamStanding.teamAbbrev["default"]!] = [Phase.DOWN : diff]
                }
            }
        }
        // now we must look at ongoing games to edit ONGO
//        for game in schedule.games {
//            let homeTeam = game.homeTeam.abbrev
//            let awayTeam = game.awayTeam.abbrev
//            let homeTeamEntry = returnDict[homeTeam]
//            if let homeTeamEntry {
//                returnDict[homeTeam] = [Phase.ONGO : homeTeamEntry.values.first!]
//            }
//            let awayTeamEntry = returnDict[awayTeam]
//            if let awayTeamEntry {
//                returnDict[awayTeam] = [Phase.ONGO : awayTeamEntry.values.first!]
//            }
//
//        }
        return convertToTeamStanding(dict: returnDict, curr: curr)
    }
    
    func returnTopChanges(teams: [TeamStandingChange], amount: Int) -> [TeamStandingChange] {
        var sortedTeams = teams.sorted { team1, team2 in
                return team1.change > team2.change
            }
        if sortedTeams.count > amount {
            sortedTeams.removeLast(sortedTeams.count - amount)
        }
        return sortedTeams
    }
    
    func convertToTeamStanding(dict: [String: [Phase: Int]], curr: Standing) -> [TeamStandingChange]{
        var returnStanding: [TeamStandingChange] = []
        for team in curr.standings {
            let entry = dict[team.teamAbbrev["default"]!]
            if let entry = entry {
                returnStanding.append(TeamStandingChange(teamStanding: team, change: entry.values.first!, phase: entry.keys.first!))
            }
        }
        return returnStanding
    }
}
