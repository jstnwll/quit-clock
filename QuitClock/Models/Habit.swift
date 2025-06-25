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
    var lastMilestone: String = ""
    var nextMilestone: String = ""
    var progress: Double = 0.0
    var isHidden: Bool = false

    init(
        habitName: String,
        startDate: Date,
        isHidden: Bool,
    ) {
        self.habitName = habitName
        self.startDate = startDate
        self.daysSinceStart = getdaysSinceStart(startDate: startDate)
        (self.lastMilestone, self.nextMilestone, self.progress) = getMilestones(
            daysSinceStart: daysSinceStart
        )
        self.isHidden = isHidden
    }

    func getdaysSinceStart(startDate: Date) -> Int {
        let daysSinceStart: Int = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
        return daysSinceStart
    }

    func getMilestones(daysSinceStart: Int) -> (String, String, Double) {
        // return lastMilestone and nextMilestone
        var lastMilestone: String = ""
        var nextMilestone: String = ""
        var progress: Double = 0.0
        
        if daysSinceStart < 1 {
            lastMilestone = "Today"
            nextMilestone = "1 day"
            progress = 0.75
        }
        else if daysSinceStart < 3 {
            lastMilestone = "1 day"
            nextMilestone = "3 days"
            progress = Double(daysSinceStart) / 3.0
        } else if daysSinceStart < 7 {
            lastMilestone = "3 days"
            nextMilestone = "1 wk"
            progress = Double(daysSinceStart) / 7.0
        } else if daysSinceStart < 14 {
            lastMilestone = "1 wk"
            nextMilestone = "2 wks"
            progress = Double(daysSinceStart) / 14.0
        } else if daysSinceStart < 30 {
            lastMilestone = "2 wks"
            nextMilestone = "1 mo"
            progress = Double(daysSinceStart) / 30.0
        } else if daysSinceStart < 60 {
            lastMilestone = "1 mo"
            nextMilestone = "2 mos"
            progress = Double(daysSinceStart) / 60.0
        } else if daysSinceStart < 90 {
            lastMilestone = "2 mos"
            nextMilestone = "3 mos"
            progress = Double(daysSinceStart) / 90.0
        } else if daysSinceStart < 180 {
            lastMilestone = "3 mos"
            nextMilestone = "6 mos"
            progress = Double(daysSinceStart) / 180.0
        } else if daysSinceStart < 270 {
            lastMilestone = "6 mos"
            nextMilestone = "9 mos"
            progress = Double(daysSinceStart) / 270.0
        } else if daysSinceStart < 365 {
            lastMilestone = "9 mos"
            nextMilestone = "1 yr"
            progress = Double(daysSinceStart) / 365.0
        } else if daysSinceStart < 540 {
            lastMilestone = "1 yr"
            nextMilestone = "18 mos"
            progress = Double(daysSinceStart) / 540.0
        } else if daysSinceStart < 730 {
            lastMilestone = "18 mos"
            nextMilestone = "2 yrs"
            progress = Double(daysSinceStart) / 730.0
        } else {
            let lastYear: Int = daysSinceStart / 365
            let nextYear: Int = lastYear + 1
            lastMilestone = "\(lastYear) yrs"
            nextMilestone = "\(nextYear) yrs"
            progress = Double(daysSinceStart / (nextYear * 365))
        }
        return (lastMilestone, nextMilestone, progress)
    }
}
