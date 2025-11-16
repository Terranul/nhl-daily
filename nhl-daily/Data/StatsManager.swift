//
//  StatsManager.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

// processes structs to produce the given results

class StatsManager {
    
    func findDailyLeaders(games: [BoxScore], max: Int) -> [PlayerStats] {
        var returnStats: [PlayerStats] = []
        for game in games{
            let gameSorted = findPlayerLeaders(teams: game.playerByGameStats)
            if (returnStats.isEmpty) {
                returnStats = gameSorted
            } else {
                returnStats = mergeSortedArrays(list1: gameSorted, list2: returnStats)
            }
        }
        var topMax = max
        if (returnStats.count < max) {
            topMax = returnStats.count
        }
        return Array(returnStats[0..<topMax])
    }
    
    func findPlayerLeaders(teams: BoxScoreTeams) -> [PlayerStats] {
        // we need to merge these players together, becuase the api structures between away,home->forwards,defense,goalies
        let awaySorted = findTeamLeader(team: teams.awayTeam)
        let homeSorted = findTeamLeader(team: teams.homeTeam)
        return mergeSortedArrays(list1: awaySorted, list2: homeSorted)
    }
    
    func findTeamLeader(team: TeamStats) -> [PlayerStats]{
        let forwardsSorted = sortByPoints(player: team.forwards)
        let defenseSorted = sortByPoints(player: team.defense)
        return mergeSortedArrays(list1: forwardsSorted, list2: defenseSorted)
    }
    
    func sortByPoints(player: [PlayerStats]) -> [PlayerStats]{
        return player.sorted { player1, player2 in
            return player1.points > player2.points
        }
    }
    
    // merges two sorted arrays into another sorted array
    func mergeSortedArrays(list1: [PlayerStats], list2: [PlayerStats]) -> [PlayerStats]{
        
        var merged : [PlayerStats] = []
        
        var i: Int = 0
        var j: Int = 0
        while (i < list1.count && j < list2.count) {
            if (list1[i].points > list2[j].points) {
                merged.append(list1[i])
                i += 1
            } else {
                merged.append(list2[j])
                j += 1
            }
        }
        
        while i < list1.count {
                merged.append(list1[i])
                i += 1
            }
            
        while j < list2.count {
            merged.append(list2[j])
            j += 1
        }
        return merged
    }
    
    func mergeSortedArraysSv(list1: [GoalieStats], list2: [GoalieStats]) -> [GoalieStats]{
        
        var merged : [GoalieStats] = []
        
        var i: Int = 0
        var j: Int = 0
        while (i < list1.count && j < list2.count) {
            if (calculateSvPtg(g: list1[i]) > calculateSvPtg(g: list2[j])) {
                merged.append(list1[i])
                i += 1
            } else {
                merged.append(list2[j])
                j += 1
            }
        }
        
        while i < list1.count {
                merged.append(list1[i])
                i += 1
            }
            
        while j < list2.count {
            merged.append(list2[j])
            j += 1
        }
        return merged
    }
    
    func findGoalieLeaders(games: [BoxScore], max: Int) -> [GoalieStats] {
        var returnStats: [GoalieStats] = []
        for game in games {
            let sortedGoalies = sortGoaliesBySvPtg(teams: game.playerByGameStats)
            if (returnStats.isEmpty) {
                returnStats = sortedGoalies
            } else {
                returnStats = mergeSortedArraysSv(list1: sortedGoalies, list2: returnStats)
            }
        }
        var topMax = max
        if (returnStats.count < max) {
            topMax = returnStats.count
        }
        return Array(returnStats[0..<topMax])
    }
    
    func sortGoaliesBySvPtg(teams: BoxScoreTeams) -> [GoalieStats]{
        let sortedAway = teams.awayTeam.goalies.sorted { g1, g2 in
            return calculateSvPtg(g: g1) > calculateSvPtg(g: g2)
        }
        let sortedHome = teams.homeTeam.goalies.sorted { g1, g2 in
            return calculateSvPtg(g: g1) > calculateSvPtg(g: g2)
        }
        
        return mergeSortedArraysSv(list1: sortedHome, list2: sortedAway)
    }
    
    func calculateSvPtg(g: GoalieStats) -> Double{
        if (!g.starter) {
            return 0
        }
        if (g.goalsAgainst + g.saves == 0) {
            return 100.0
        }
        return Double(g.saves)/Double(g.goalsAgainst + g.saves)
    }
}
