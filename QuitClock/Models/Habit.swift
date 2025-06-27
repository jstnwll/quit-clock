//
//  Habit.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/23/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Habit: Identifiable {
    var habitName: String
    var habitStartDate: Date
    var daysSinceStart: Int
    var lastMilestone: Milestone
    var nextMilestone: Milestone

    init(
        habitName: String,
        habitStartDate: Date
    ) {
        self.habitName = habitName
        self.habitStartDate = habitStartDate
        self.daysSinceStart = getDaysSinceStart(startDate: habitStartDate)
        (self.lastMilestone, self.nextMilestone) = getMilestones(daysSinceStart: daysSinceStart)
    }
}
