//
//  GetMilestones.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/26/25.
//

import Foundation
import SwiftUI

func getMilestones(daysSince: Int) -> (Milestone, Milestone) {
    let milestones: [Milestone] = [
        Milestone(name: "Today", days: 0, color: .teal),
        Milestone(name: "24 hr", days: 1, color: .green),
        Milestone(name: "1 wk", days: 7, color: .cyan),
        Milestone(name: "1 mo", days: 30, color: .yellow),
        Milestone(name: "3 mo", days: 90, color: .blue),
        Milestone(name: "6 mo", days: 180, color: .orange),
        Milestone(name: "9 mo", days: 270, color: .indigo),
        Milestone(name: "1 yr", days: 365, color: .pink),
        Milestone(name: "18 mo", days: 540, color: .purple),
        Milestone(name: "2 yr", days: 730, color: .red),
        // Milestone(name: "Multiple years", days: 730+, color: .mint)
    ]

    var lastMilestone: Milestone = milestones[0]
    var nextMilestone: Milestone = milestones[1]

    for i in 0..<(milestones.count - 1) {
        if daysSince >= milestones[i].days
            && daysSince < milestones[i + 1].days
        {
            lastMilestone = milestones[i]
            nextMilestone = milestones[i + 1]
        } else if daysSince >= milestones[milestones.count - 1].days {
            let lastYear: Int = daysSince / 365
            let nextYear: Int = lastYear + 1
            lastMilestone = Milestone(
                name: "\(lastYear) yr",
                days: lastYear * 365,
                color: .yellow
            )
            nextMilestone = Milestone(
                name: "\(nextYear) yr",
                days: nextYear * 365,
                color: .orange
            )
        }
    }
    return (lastMilestone, nextMilestone)
}
