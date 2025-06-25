//
//  Habit.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/23/25.
//

import Foundation
import SwiftData

@Model
class Habit: Identifiable {
    var id: String = UUID().uuidString
    var habitName: String = ""
    var startDate: Date = Date()
    var daysSinceStart: Int = 0
    var isHidden: Bool = false

    init(
        habitName: String,
        startDate: Date,
        isHidden: Bool,
    ) {
        self.habitName = habitName
        self.startDate = startDate
        self.daysSinceStart = getdaysSinceStart(startDate: startDate)
        self.isHidden = isHidden
    }
    
    func getdaysSinceStart(startDate: Date) -> Int {
        return 12
    }
    
    func getlastMilestone(daysSinceStart: Int) {
        // return lastMilestone and nextMilestone
        // _ = [
        //     "1 day": 1,
        //     "3 days": 3,
        //     "1 wk": 7,
        //     "2 wks": 14,
        //     "1 mo": 30,
        //     "2 mos": 60,
        //     "3 mos": 90,
        //     "6 mos": 180,
        //     "9 mos": 270,
        //     "1 yr": 365,
        //     "18 mos": 540,
        //     "2 yr": 730,
        // ]
        return
    }
    
    
    // TODO: Add functions to the Habit Model so habit.daysSinceStart can be used

    func getProgress() {}
}
