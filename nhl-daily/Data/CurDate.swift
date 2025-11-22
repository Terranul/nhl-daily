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
        let nextDay = dateDisplayed + interval
        dateDisplayed = nextDay
        return returnDateAsString(date: nextDay)
    }
    
    func getPrevDay() -> String {
        let interval: TimeInterval = 86400
        let prevDay = dateDisplayed - interval
        dateDisplayed = prevDay;
        return returnDateAsString(date: prevDay)
    }
    
    func getCurDay() -> Date{
        return dateDisplayed
    }
    
    func returnDateAsString(date: Date) -> String{
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func getPrevDayStatic() -> String {
        let interval: TimeInterval = 86400
        let prevDay = dateDisplayed - interval
        return returnDateAsString(date: prevDay)
    }
    
    func getNextDayStatic() -> String {
        // just a double but typealias is so much cooler
        let interval: TimeInterval = 86400
        let nextDay = dateDisplayed + interval
        return returnDateAsString(date: nextDay)
    }
    
    // check if the current user selected date is eqivalent to the present date (only consider the day not hours or minutes)
    func isCurDate() -> Bool {
        let presentDay = Date()
        let leftBound = presentDay - 86400
        let rightBound = presentDay + 86400
        return dateDisplayed > leftBound && dateDisplayed < rightBound
    }
    
    // check if the current user selected date is in the future (only consider the day number)
    func isInFuture() -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let startOfDisplayedDay = calendar.startOfDay(for: dateDisplayed)
        return startOfDisplayedDay > today
    }
    
}
