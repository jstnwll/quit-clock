//
//  SummaryCardView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/17/25.
//

import SwiftUI

struct SummaryCardView: View {
    var habitName: String = "Cake"
    var habitStartDate: Date = Date()
    var daysSinceStart: Int = 10
    var lastMilestone: Milestone = Milestone(name: "1 week", days: 7, color: .green)
    var nextMilestone: Milestone = Milestone(name: "2 weeks", days: 14, color: .blue)
    
    @State private var current: Double = 0.0

    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            VStack(alignment: .leading){
                Text(habitName)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(formatDate(date: habitStartDate))
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(lastMilestone.name)
                .font(.callout)
                .foregroundStyle(.green)
            
            Gauge(
                value: current,
                in: Double(lastMilestone.days)...Double(nextMilestone.days)
            ) {
                } currentValueLabel: {
                    Text(String(daysSinceStart))
                        .foregroundStyle(lastMilestone.color)
                }
                .gaugeStyle(.accessoryCircular)
                .scaleEffect(1.2)
                .tint(Gradient(colors: [lastMilestone.color, nextMilestone.color]))
            Text(nextMilestone.name)
                .font(.callout)
                .foregroundStyle(nextMilestone.color)
            Spacer()
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2.0)) {
                current = Double(daysSinceStart)
                 // Animate to intended value
            }
        }
    }
}

#Preview {
    SummaryCardView()
}
