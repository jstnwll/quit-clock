//
//  GetMilestones.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/26/25.
//

import Foundation
import SwiftUI

func getMilestones(daysSinceStart: Int) -> (Milestone, Milestone) {
    let milestones: [Milestone] = [
        Milestone(name: "Today", days: 0, color: .cyan),
        Milestone(name: "24 hours", days: 1, color: .white),
        Milestone(name: "1 week", days: 7, color: .teal),
        Milestone(name: "1 month", days: 30, color: .red),
        Milestone(name: "2 months", days: 60, color: .yellow),
        Milestone(name: "3 months", days: 90, color: .green),
        Milestone(name: "6 months", days: 180, color: .blue),
        Milestone(name: "9 months", days: 270, color: .purple),
        Milestone(name: "1 year", days: 365, color: .orange),
        Milestone(name: "18 months", days: 540, color: .gray),
        Milestone(name: "2 years", days: 730, color: .pink),
        // Milestone(name: "Multiple years", days: 730+, color: .mint)
    ]

    var lastMilestone: Milestone = milestones[0]
    var nextMilestone: Milestone = milestones[1]

    for i in 0...milestones.count {
        if daysSinceStart >= milestones[i].days
            && daysSinceStart < milestones[i + 1].days
        {
            lastMilestone = milestones[i]
            nextMilestone = milestones[i + 1]
        } else if daysSinceStart >= milestones[milestones.count - 1].days {
            let lastYear: Int = daysSinceStart / 365
            let nextYear: Int = lastYear + 1
            lastMilestone = Milestone(
                name: "\(lastYear) yrs",
                days: lastYear * 365,
                color: .green
            )
            nextMilestone = Milestone(
                name: "\(nextYear) yrs",
                days: nextYear * 365,
                color: .green
            )
        }
    }
    return (lastMilestone, nextMilestone)
}
