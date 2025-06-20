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
                    habit: "Cocaine",
                    startDate: "June 4, 2009",
                    days: 5_859
                )
                SummaryCardView(
                    habit: "Meth",
                    startDate: "December 2, 2023",
                    days: 565
                )
                SummaryCardView(
                    habit: "Oxycodone",
                    startDate: "January 12, 2025",
                    days: 157
                )
                Spacer()
            }
            .padding()
            .navigationBarTitle("Quit Clock")
        }
        TabView {
            Tab("Add", systemImage: "plus") {
            }
        }
    }
}

#Preview {
    SummaryView()
}
