//
//  Landing.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import SwiftUI

struct Landing:View {
    
    @State var curDate: String
    @State var prevDate: String
    var dateHandler: CurDate = CurDate(dateDisplayed: Date())
    
    init() {
        curDate = dateHandler.returnDateAsString(date: Date())
        prevDate = dateHandler.returnDateAsString(date: Date() - 86400)
    }
    
    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        self.curDate = dateHandler.getPrevDay()
                        self.prevDate = dateHandler.getPrevDayStatic()
                    } label: {
                        Text("<")
                    }
                    .padding(5)
                    Text(curDate)
                        .foregroundStyle(Color.white)
                    Button {
                        self.prevDate = curDate
                        self.curDate = dateHandler.getNextDay()
                    } label: {
                        Text(">")
                    }
                    Spacer()
                }
                Container(date: $curDate, prevDate: $prevDate)
                    .padding(5)
                Spacer()
        }
    }
}
