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
    @State private var showingEditHabitView = false
    @State private var habitToEdit: Habit? = nil
    let today: Date = Date()

    var body: some View {
        NavigationStack {
            VStack {
                if habits.isEmpty {
                    Text("Add something to quit!")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(habits) { habit in
                        SummaryCardView(
                            habitName: habit.habitName,
                            startDate: habit.startDate,
                            daysSinceStart: habit.daysSinceStart,
                            lastMilestone: habit.lastMilestone,
                            nextMilestone: habit.nextMilestone,
                            progress: habit.progress,
                        )
                        .onTapGesture {
                            habitToEdit = habit
                        }
                    }
                    .sheet(item: $habitToEdit) { habit in
                        EditHabitView(habit: habit)
                    }
                    Spacer()
                }
            }
            .padding(10)
            .navigationBarTitle("Summary")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    if habits.count < 3 {
                        // TODO: Change .confirm to .primary if API changes
                        Button("\(Image(systemName: "plus"))", role: .confirm) {
                            showingAddHabitView.toggle()
                        }
                        .sheet(
                            isPresented: $showingAddHabitView,
                            content: { AddHabitView() }
                        )
                    } else {
                        Button("\(Image(systemName: "plus"))") {}
                            .disabled(true)
                    }
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
