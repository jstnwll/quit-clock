//
//  SummaryView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/19/25.
//

import SwiftData
import SwiftUI

struct SummaryView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Habit> { $0.isHidden == false }) private
        var habits: [Habit]
    @State private var showingAddHabitView = false
    let today: Date = Date()

    var body: some View {
        NavigationStack {
            VStack {
                if habits.isEmpty {
                    Text("Add something you quit!")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(habits) { habit in
                        SummaryCardView(
                            habitName: habit.habitName,
                            startDate: habit.startDate,
                            daysSinceStart: habit.daysSinceStart
                        )
                    }
                    Spacer()
                }
            }
            .padding(5)
            .navigationBarTitle("Summary")
            .toolbar {
                ToolbarItem(placement: .largeSubtitle) {
                    Text(formatDate(startDate: today))
                    .foregroundStyle(.secondary)
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("\(Image(systemName: "plus"))") {
                        showingAddHabitView.toggle()
                    }
                    .sheet(
                        isPresented: $showingAddHabitView,
                        content: { AddHabitView() }
                    )
                    .tint(.accentColor)
                    .disabled(habits.count >= 3)
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Habit.self, configurations: config)

    return SummaryView()
        .modelContainer(container)
}
 
