//
//  EditHabitView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/25/25.
//

import SwiftData
import SwiftUI

struct EditHabitView: View {
    let habit: Habit
    @State private var name: String
    @State private var date: Date
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    init(habit: Habit) {
        self.habit = habit
        _name = State(initialValue: habit.name)
        _date = State(initialValue: habit.date)
    }

    var body: some View {

        NavigationStack {
            VStack {
                TextField("Habit Name", text: $name)
                    .onChange(of: name) { oldValue, newValue in
                        if newValue.count > 15 {
                            name = String("\(newValue.prefix(15))")
                        }
                    }
                    .accessibilityHint("Edit the name of the habit.")
                DatePicker(
                    "Quit Date",
                    selection: $date,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .accessibilityHint("Edit the date you quit the habit.")
                Spacer()
            }
            .padding()
            .background(.windowBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("\(Image(systemName: "xmark"))", role: .cancel) {
                        dismiss()
                    }
                    .accessibilityLabel("Cancel editing habit.")
                }
                ToolbarItem(placement: .title) {
                    Text("Edit Habit")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // TODO: Change .confirm to .primary if API changes
                    if name.isEmpty
                        || name.trimmingCharacters(in: .whitespaces) == ""
                        || date > Date()
                    {
                        Button("\(Image(systemName: "checkmark"))") {}
                            .disabled(true)
                    } else {
                        Button(
                            "\(Image(systemName: "checkmark"))",
                            role: .confirm
                        ) {
                            saveHabit()
                            name = ""
                            dismiss()
                        }
                        .accessibilityLabel("Save changes to habit.")
                    }
                }
            }
        }
    }
    func saveHabit() {
        habit.name = name
        habit.date = date
        try? modelContext.save()
    }
}

#Preview {
    let sampleHabit = Habit(name: "Sugar", date: Date())
    EditHabitView(habit: sampleHabit)
}
