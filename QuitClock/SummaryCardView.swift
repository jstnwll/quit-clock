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
    // Calculate based on today - startDate
    var formattedDays: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: days)) ?? "\(days)"
    }

    var body: some View {
        VStack {
            HStack {
                // Use total days as metric to calculate percentage
                // Use singular for 1 (ie 1 week)
                // Don't show if 0 (ie 2 years 1 week and 3 days)
                // Animate on open
                // 1 day
                // 3 days
                // 1 week = 7 days
                // 2 weeks = 14 days
                // 1 month = 30 days
                // 2 months = 60 days
                // 3 months = 90 days
                // 6 months = 180 days
                // 9 months = 270 days
                // 1 year = 365 days
                // 18 months = 540 days
                // 2 years = 730 days
                // Celebrate each subsequent year after

                CircularProgressView(
                    color: .yellow,
                    progress: 1.0,
                    milestone: "3 mo"
                )
                .padding(.trailing, 10)
                Spacer()
                VStack {
                    Text(habit)
                        .font(.title2)
                        .bold()
                    Text("\(formattedDays) days")
                        .font(.headline)
                        .bold()
                    Text("Since \(startDate)")
                        .font(.caption2)
                        .bold(true)
                }
                Spacer()
                CircularProgressView(
                    color: .red,
                    progress: 0.25,
                    milestone: "2 yr"
                )
                .padding(.leading, 10)
            }

        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}

#Preview {
    SummaryCardView(
        habit: "Cocaine",
        startDate: "December 12, 2024",
        days: 5165
    )
}
