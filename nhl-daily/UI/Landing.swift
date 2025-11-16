//
//  Landing.swift
//  nhl-daily
//
//  Created by Ben Faraone on 2025-11-15.
//

import SwiftUI

struct Landing:View {
    
    @State var curDate: String? = nil
    var dateHandler: CurDate = CurDate(dateDisplayed: Date())
    
    var body: some View {
        if let curDate = curDate {
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
                    Button {
                        self.curDate = dateHandler.getNextDay()
                    } label: {
                        Text(">")
                    }
                    Spacer()
                }
            }
        }
    }
}
