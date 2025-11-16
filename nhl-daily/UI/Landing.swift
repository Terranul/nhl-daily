//
//  Landing.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import SwiftUI

struct Landing:View {
    
    @State var curDate: String
    var dateHandler: CurDate = CurDate(dateDisplayed: Date())
    
    init() {
        self.curDate = dateHandler.returnDateAsString(date: Date())
    }
    
    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        self.curDate = dateHandler.getPrevDay()
                    } label: {
                        Text("<")
                    }
                    .padding(5)
                    Text(curDate)
                        .foregroundStyle(Color.white)
                    Button {
                        self.curDate = dateHandler.getNextDay()
                    } label: {
                        Text(">")
                    }
                    Spacer()
                }
                Container(date: $curDate)
                    .padding(5)
                Spacer()
        }
    }
}
