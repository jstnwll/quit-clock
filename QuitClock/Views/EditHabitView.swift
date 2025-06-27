//
//  EditHabitView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/25/25.
//

import SwiftData
import SwiftUI

struct EditHabitView: View {
    @Bindable var habit: Habit
    @State private var name: String = ""
    @State private var date: Date = Date()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    init(habit: Habit) {
        _habit = Bindable(wrappedValue: habit)
        _name = State(initialValue: habit.habitName)
        _date = State(initialValue: habit.startDate)
    }

    var body: some View {

        NavigationStack {
            VStack {
                TextField("Habit Name", text: $name)
                    .onChange(of: name) { oldValue, newValue in
                        if newValue.count > 12 {
                            name = String("\(newValue.prefix(12))")
                        }
                    }
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                Spacer()
            }
            .padding()
            .background(.windowBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("", systemImage: "xmark", role: .cancel) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .title) {
                    Text("Edit Habit")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // TODO: Change .confirm to .primary if API changes
                    if habit.habitName.isEmpty
                        || habit.habitName.trimmingCharacters(in: .whitespaces)
                            == ""
                        || habit.startDate > Date()
                    {
                        Button("\(Image(systemName: "checkmark"))") {}
                            .disabled(true)
                    } else {
                        Button(
                            "\(Image(systemName: "checkmark"))",
                            role: .confirm
                        ) {
                            habit.habitName = name
                            habit.startDate = date
                            habit.daysSinceStart = habit.getDaysSinceStart(
                                startDate: date
                            )
                            (
                                habit.lastMilestone, habit.nextMilestone,
                                habit.progress
                            ) = habit.getMilestones(
                                daysSinceStart: habit.daysSinceStart
                            )
                            try? modelContext.save()
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(
                        "\(Image(systemName: "trash"))",
                        role: .destructive
                    ) {
                        //habit.isHidden = true
                        try? modelContext.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditHabitView(
        habit: Habit(
            habitName: "Sugar",
            startDate: Date()
        )
    )
}
