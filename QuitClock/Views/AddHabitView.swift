//
//  AddHabitView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/23/25.
//

import SwiftData
import SwiftUI

struct AddHabitView: View {
    @State private var name: String = ""
    @State private var date = Date()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {

        NavigationStack {
            VStack {
                TextField("Habit Name", text: $name)
                    .accessibilityLabel("Habit Name")
                    .onChange(of: name) { oldValue, newValue in
                        name = newValue
                    }
                    .accessibilityHint(
                        "Enter the name of the habit."
                    )
                DatePicker(
                    "Quit Date",
                    selection: $date,
                    displayedComponents: .date
                )
                .accessibilityLabel("Quit Date")
                .accessibilityHint("Enter the date you quit the habit.")
                .datePickerStyle(.graphical)
                Spacer()
            }
            .accessibilityElement(children: .combine)
            .padding()
            .background(.windowBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("\(Image(systemName: "xmark"))", role: .cancel) {
                        dismiss()
                    }
                    .accessibilityLabel("Cancel adding habit")
                    .accessibilityHint("Dismisses this screen and discards your changes")
                }
                ToolbarItem(placement: .title) {
                    Text("New Habit")
                        .accessibilityLabel("New Habit")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    let isDisabled = name.isEmpty
                        || name.trimmingCharacters(in: .whitespaces) == ""
                        || date > Date()
                    
                    if isDisabled {
                        Button("\(Image(systemName: "checkmark"))") {}
                            .disabled(true)
                            .accessibilityLabel("Save new habit (disabled)")
                            .accessibilityHint("Fill in all fields to enable this button")
                    } else {
                        Button(
                            "\(Image(systemName: "checkmark"))",
                            role: .confirm
                        ) {
                            addHabit()
                            name = ""
                            dismiss()
                        }
                        .accessibilityLabel("Save new habit")
                        .accessibilityHint("Save and track this habit")
                    }
                }
            }
        }
    }
    func addHabit() {
        modelContext.insert(
            Habit(name: name, date: date)
        )
        try? modelContext.save()

    }
}

#Preview {
    AddHabitView()
}

