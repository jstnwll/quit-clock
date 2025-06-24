//
//  SummaryView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/19/25.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        NavigationStack {
            VStack {
                SummaryCardView(
                    habit: "Drinking",
                    startDate: "June 4, 2009",
                    days: 5_859
                )
                SummaryCardView(
                    habit: "Sugar",
                    startDate: "December 22, 2023",
                    days: 565
                )
                SummaryCardView(
                    habit: "Swearing",
                    startDate: "January 12, 2025",
                    days: 157
                )
                Spacer()
            }
            .padding(5)
            .navigationBarTitle("Quit Clock")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    SummaryView()
}
