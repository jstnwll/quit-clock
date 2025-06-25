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
    var daysSinceStart: String = ""

    var body: some View {
        VStack {
            HStack {
                // Last milestone completed
                ZStack {
                    Circle()
                        .trim(from: 0.02, to: 0.98)
                        .stroke(
                            Color.yellow,
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .frame(maxWidth: 75, maxHeight: 75)
                    Text("3 days")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .padding(.trailing, 10)
                Spacer()
                VStack(spacing: 5) {
                    Text(habitName)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(daysSinceStart)
                        .font(.headline)
                        .fontWeight(.medium)
                    Text("Since \(formatDate(startDate: startDate))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                // Next milestone to achieve
                // Calculate progress based on totalDays / milestoneDays
                ZStack {
                    Circle()
                        .trim(from: 0.02, to: 0.50)
                        .stroke(
                            Color.red,
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .frame(maxWidth: 75, maxHeight: 75)
                    Text("18 mos")
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
    SummaryCardView(habitName: "Test", startDate: Date(), daysSinceStart: "123 days")
}
