//
//  CurDate.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import Foundation

class CurDate {
    
    let dateFormatter: DateFormatter = DateFormatter()
    // we'll let the View init the dateDisplayed (probably shouldn't but hatever)
    var dateDisplayed: Date
    
    init(dateDisplayed: Date) {
        self.dateDisplayed = dateDisplayed
    }
    
    func getNextDay() -> String{
        // just a double but typealias is so much cooler
        let interval: TimeInterval = 86400
        var nextDay = dateDisplayed + interval
        dateDisplayed = nextDay
        return returnDateAsString(date: nextDay)
    }
    
    func getPrevDay() -> String {
        let interval: TimeInterval = 86400
        var prevDay = dateDisplayed - interval
        dateDisplayed = prevDay;
        return returnDateAsString(date: prevDay)
    }
    
    func getCurDay() -> Date{
        return dateDisplayed
    }
    
    func returnDateAsString(date: Date) -> String{
        return dateFormatter.string(from: date)
    }
    
}
