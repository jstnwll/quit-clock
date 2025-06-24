//
//  SummaryCardView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/17/25.
//

import SwiftUI

struct SummaryCardView: View {
    let habit: String
    let startDate: String
    let days: Int

    var body: some View {
        VStack {
            HStack {
                // Last milestone completed
                ZStack {
                    Circle()
                        .trim(from: 0.01, to: 0.99)
                        .stroke(
                            Color.yellow,
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .frame(maxWidth: 75, maxHeight: 75)
                    Text("13 mo")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .padding(.trailing, 10)
                Spacer()
                VStack(spacing: 5) {
                    Text(habit)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("\(formatDays(days)) days")
                        .font(.headline)
                        .fontWeight(.medium)
                    Text("Since \(startDate)")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                // Next milestone to achieve
                // Calculate progress based on totalDays / milestoneDays
                ZStack {
                    Circle()
                        .trim(from: 0.01, to: 0.50)
                        .stroke(
                            Color.red,
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .frame(maxWidth: 75, maxHeight: 75)
                    Text("12 yr")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .padding(.leading, 10)
            }

        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(15)
        .padding(.top, 5)
    }

    func getDaysSinceStart() {
        // return daysSinceStart
    }

    func getMilestones(daysSinceStart: Int) {
        // return lastMilestone and nextMilestone
        let milestones = [
            "1 day": 1,
            "3 days": 3,
            "1 wk": 7,
            "2 wks": 14,
            "1 mo": 30,
            "2 mos": 60,
            "3 mos": 90,
            "6 mos": 180,
            "9 mos": 270,
            "1 yr": 365,
            "18 mos": 540,
            "2 yr": 730,
        ]
    }

    func formatDays(_ days: Int) -> String {
        // return days formatted with comma
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        let formattedDays: String =
            formatter.string(from: NSNumber(value: days)) ?? "\(days)"

        return formattedDays
    }
}

#Preview {
    SummaryCardView(
        habit: "Cocaine",
        startDate: "December 12, 2024",
        days: 5165
    )
}
