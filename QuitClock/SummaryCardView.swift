//
//  SummaryCardView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/17/25.
//

import SwiftUI

struct SummaryCardView: View {
    var habit: String = "Drinking"
    // var startDate: Date = ?
    
    // Calculate based on today - startDate
    // var totalDays: Int = 0
    // var days: Int = 0
    // var weeks: Int = 0
    // var months: Int = 0
    // var years: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
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
                    color: .green,
                    progress: 1.0,
                    milestone: "3 mo"
                )
                .padding(.trailing, 5)
                Text(habit)
                    .font(.title)
                    .bold()
                CircularProgressView(
                    color: .red,
                    progress: 0.25,
                    milestone: "2 yr"
                )
                .padding(.leading, 5)
            }
            VStack(alignment: .leading) {
                Text("2 years - 1 month - 3 weeks - 3 days")
                    .multilineTextAlignment(.leading)
                Text("since December 12, 2019")
                    .multilineTextAlignment(.leading)
            }
            .padding(.top, 5)
        }
    }
}

#Preview {
    SummaryCardView()
}
