//
//  SummaryCardView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/17/25.
//

import SwiftData
import SwiftUI

struct SummaryCardView: View {
    var habitName: String = ""
    var startDate: Date = Date()
    var daysSinceStart: Int = 0
    var lastMilestone: String = ""
    var nextMilestone: String = ""
    var progress: Double = 0.0
    
    var body: some View {
        HStack {
            // Last milestone completed
            ZStack {
                Circle()
                    .trim(from: 0.02, to: 0.98)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(maxWidth: 75, maxHeight: 75)
                Text(lastMilestone)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(spacing: 5) {
                Text(habitName.trimmingCharacters(in: .whitespaces))
                    .font(.title2)
                    .fontWeight(.semibold)
                if daysSinceStart == 1 {
                    Text("\(daysSinceStart) day")
                        .font(.headline)
                        .fontWeight(.medium)
                } else {
                    Text("\(daysSinceStart) days")
                        .font(.headline)
                        .fontWeight(.medium)
                }
                Text("Since \(formatDate(startDate: startDate))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            // Next milestone to achieve
            // Calculate progress based on totalDays / milestoneDays
            ZStack {
                Circle()
                    .trim(from: 0.02, to: (progress - 0.02))
                    .stroke(
                        Color.red,
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(maxWidth: 75, maxHeight: 75)
                Text(nextMilestone)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SummaryCardView(
        habitName: "Ice Creams",
        startDate: Date(),
        daysSinceStart: 1,
        lastMilestone: "1 mo",
        nextMilestone: "2 mo",
        progress: 0.75
    )
}
