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
    @Query private var habits: [Habit]
    @State private var showingAddHabitSheet: Bool = false
    @State private var habitToEdit: Habit? = nil
    var today: String = formatDate(date: Date())

    var body: some View {
        NavigationStack {
            List {
                ForEach(habits) { habit in
                    SummaryCardView(name: habit.name, date: habit.date)
                        .swipeActions(edge: .trailing) {
                            Button(
                                role: .destructive,
                                action: { deleteHabit(habit: habit) }
                            ) {
                                Image(systemName: "trash")
                            }
                            Button(action: { habitToEdit = habit }) {
                                Image(systemName: "pencil")
                            }
                        }
                }
                .sheet(item: $habitToEdit) { habit in
                    EditHabitView(habit: habit)
                }
            }
            .listRowSpacing(10)
            .listRowSeparator(.hidden)
            .navigationTitle("Summary")
            .navigationSubtitle(today)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    if habits.count >= 3 {
                        Button(action: {}) {
                            Image(systemName: "plus")
                        }
                        .disabled(true)
                    } else {
                        Button(
                            role: .confirm,
                            action: { showingAddHabitSheet.toggle() }
                        ) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showingAddHabitSheet) {
                            AddHabitView()
                        }

                    }
                }
            }
            if habits.isEmpty {
                VStack {
                    Text("Add a habit to get started!")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
        }
    }

    func deleteHabit(habit: Habit) {
        modelContext.delete(habit)
        try? modelContext.save()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Habit.self, configurations: config)

    return SummaryView()
        .modelContainer(container)
}
