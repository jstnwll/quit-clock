//
//  SummaryCardView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/17/25.
//

import SwiftUI

struct SummaryCardView: View {
    var name: String = "Cake"
    var date: Date = Date()
    var daysSince: Int { getDaysSince(date: date) }
    var lastMilestone: Milestone { getMilestones(daysSince: daysSince).0 }
    var nextMilestone: Milestone { getMilestones(daysSince: daysSince).1 }

    @State private var current: Double = 0.0

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(formatDate(date: date))
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(lastMilestone.name)
                .font(.callout)
                .foregroundStyle(lastMilestone.color)

            // Provide detailed accessibility information for the gauge
            Gauge(
                value: current,
                in: Double(lastMilestone.days)...Double(nextMilestone.days)
            ) {
            } currentValueLabel: {
                Text(" \(daysSince) ")
                    .foregroundStyle(lastMilestone.color)
            }
            .gaugeStyle(.accessoryCircular)
            .scaleEffect(1.25)
            .tint(Gradient(colors: [lastMilestone.color, nextMilestone.color]))
            .accessibilityLabel("Progress toward next milestone")
            .accessibilityValue("\(daysSince) days since quitting. Next milestone: \(nextMilestone.name) in \(nextMilestone.days - daysSince) days.")
            
            Text(nextMilestone.name)
                .font(.callout)
                .foregroundStyle(nextMilestone.color)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(name), quit on \(formatDate(date: date)). Current streak: \(daysSince) days. Last milestone reached: \(lastMilestone.name). Next milestone: \(nextMilestone.name). Progress: \(Int((current - Double(lastMilestone.days)) / Double(nextMilestone.days - lastMilestone.days) * 100)) percent.")
        .onAppear {
            withAnimation(.easeOut(duration: 2.0)) {
                current = (daysSince == 0) ? 0.75 : Double(daysSince)
                // Animate to intended value
            }
        }
    }
}

#Preview {
    SummaryCardView()
}
